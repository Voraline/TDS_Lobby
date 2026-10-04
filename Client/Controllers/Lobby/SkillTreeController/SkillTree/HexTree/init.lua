-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree.HexTree
-- Decompile time: 11.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
require(script.HexTile.HexCoordinate)
local HexTile = require(script.HexTile)
local Promise = require(ReplicatedStorage.Packages.Promise)
local atom = Charm.atom
local subscribe = Charm.subscribe
local u24 = {}
u24.__index = u24
u24.__class = "HexTree"

function u24.new(a1, a2, a3, a4, a5) -- Line: 51
    -- upvalues: atom (val), u24 (val), subscribe (val)
    local v1 = {
        Initialized = false,
        TileCount = 0,
        SkillTreeAtoms = a1,
        Atoms = {Active = atom(false)},
        CoordinateMap = a4,
        NodeDataMap = a5,
        TileMeshes = {},
        Threads = {},
        TileMap = {},
        Tiles = {},
        Promises = {},
        ActivatorTiles = {},
    }
    local u18 = setmetatable(v1, u24)
    u18:_createTiles(a2, a3)
    subscribe(u18.Atoms.Active, function(a1, a2) -- Line: 77 -- upvalues: u18 (val)
        if a1 then
            u18:_setActive()
            return
        end
        u18:_setInactive()
    end)
    return u18
end

function u24:GetTileAt(a2, a3) -- Line: 88 -- types: self: table, a2: number, a3: number
    return self.TileMap[a2] and self.TileMap[a2][a3]
end

function u24.SetActivatorTiles(a1, a2) -- Line: 92 -- types: a1: table, a2: table
    a1.ActivatorTiles = a2
end

function u24:GetNeighbors(a2) -- Line: 97
    local TileAt, v1
    local v2 = {}
    for i = 0, 5 do
        v1 = a2.Coordinate:Neighbor(i)
        TileAt = self:GetTileAt(v1.q, v1.r)
        if TileAt then
            table.insert(v2, TileAt)
        end
    end
    return v2
end

function u24:Render(...) -- Line: 114
    for i, j in self.Tiles do
        j:Render(...)
    end
end

function u24:RippleFromTile_BFS(a2, a3, a4) -- Line: 121
    -- upvalues: Promise (val)
    if not self.Initialized then
        return
    end
    table.insert(self.Promises, (Promise.new(function() -- Line: 133 -- upvalues: a2 (val), self (ref), Promise (upval), a3 (val), a4 (val)
        local depth, v1, v2
        local v3 = {}
        local v4 = {}
        local Coordinate = a2.Coordinate
        v3[(Coordinate:ToString())] = true
        table.insert(v4, {depth = 0, tile = a2})
        while #v4 > 0 do
            v2 = table.remove(v4, 1)
            if v2 then
                local tile = v2.tile
                depth = v2.depth
                local u22 = depth * 0.05
                table.insert(self.Promises, (Promise.new(function() -- Line: 158 -- upvalues: u22 (val), tile (val), Coordinate (val), a3 (upval), a4 (upval)
                    task.wait(u22)
                    local v1 = tile.Coordinate:Subtract(Coordinate)
                    local v2 = Vector3.new(v1.q, 0, v1.r)
                    if not (0 < v2.Magnitude) then
                        tile._tiltAxis = Vector3.new(1, 0, 0)
                    else
                        tile._tiltAxis = (v2:Cross((Vector3.new(0, 1, 0)))).Unit
                    end
                    tile.TiltSpring:SetOffset(a3 or 90, true)
                    tile.TiltSpring:SetGoal(0)
                    tile.BounceSpring:SetOffset(a4 or 1, true)
                    tile.BounceSpring:SetGoal(0)
                    tile.Atoms.Visible(true)
                end)))
                for i, j in self:GetNeighbors(tile) do
                    v1 = j.Coordinate:ToString()
                    if not v3[v1] then
                        v3[v1] = true
                        table.insert(v4, {tile = j, depth = depth + 1})
                    end
                end
            end
        end
        table.clear(v4)
    end)))
end

function u24.RippleFromTile_Distance(a1, a2, a3) -- Line: 197
    -- upvalues: Promise (val)
    if not a1.Initialized then
        return
    end
    local Coordinate = a2.Coordinate
    table.insert(a1.Promises, (Promise.new(function() -- Line: 206 -- upvalues: a1 (ref), Coordinate (val), Promise (upval), a3 (val)
        local v1
        for i, j in a1.Tiles do
            j.Atoms.Visible(true)
            v1 = Coordinate
            local u20 = (j.Coordinate:DistanceTo(v1)) * 0.1
            table.insert(a1.Promises, (Promise.new(function() -- Line: 215 -- upvalues: u20 (val), j (val), Coordinate (upval), a3 (upval)
                task.wait(u20)
                local v1 = j.Coordinate:Subtract(Coordinate)
                local v2 = Vector3.new(v1.q, 0, v1.r)
                if v2.Magnitude == 0 then
                    return
                end
                j._tiltAxis = (v2:Cross((Vector3.new(0, 1, 0)))).Unit
                j:PlayUnlockAnimation(a3)
                j.Atoms.Visible(true)
            end)))
        end
    end)))
end

function u24.SetActive(a1, a2) -- Line: 239 -- types: a1: table, a2: boolean
    a1.Atoms.Active(a2)
end

function u24.GetTileIndexFromMesh(a1, a2) -- Line: 245 -- types: a1: table, a2: userdata
    for i, j in a1.TileMeshes do
        if j == a2 then
            return i
        end
    end
    return nil
end

function u24:_placeTile(a2, a3, a4, a5) -- Line: 257
    -- upvalues: HexTile (val)
    self.TileCount = self.TileCount + 1
    local v1 = HexTile.new(self.TileCount, a2, a3, a4, a5, self.NodeDataMap and self.NodeDataMap[a5])
    self.Tiles[a5] = v1
    self.TileMeshes[a5] = v1.Mesh
    local TileMap = self.TileMap
    local v2 = self.TileMap[a2] or {}
    TileMap[a2] = v2
    self.TileMap[a2][a3] = v1
    if a4 then
        self.RootTile = v1
    end
    return v1
end

function u24.WaitUntilLoaded(a1) -- Line: 277
    repeat
        task.wait(1)
    until a1.Initialized
end

function u24:_createTiles(a2, a3) -- Line: 283 -- types: self: table, a2: number?, a3: number?
    local TileMap, q_2, v1, v2, v3, v4
    if not self.CoordinateMap then
        return
    end
    local CoordinateMap = self.CoordinateMap
    local v5 = nil
    local v6 = nil
    local v7, v8, v9 = self, a2, a3
    for i, j in CoordinateMap, v5, v6 do
        v3 = false
        if v8 and v9 and v8 == j.q and v9 == j.r then
            v3 = true
        end
        v4 = v7:_placeTile(j.q, j.r, v3, i)
        TileMap = v7.TileMap
        q_2 = j.q
        v2 = v7.TileMap[j.q] or {}
        TileMap[q_2] = v2
        v1 = v7.TileMap[j.q]
        v1[j.r] = v4
    end
    v7.Initialized = true
end

function u24:_setActive() -- Line: 305
    self:RippleFromTile_BFS(self.RootTile)
end

function u24:_setInactive() -- Line: 310
    for i, j in self.Promises do
        j:cancel()
    end
    for k, n in self.Tiles do
        n.Atoms.Visible(false)
        n.TiltSpring:SetGoal(0)
    end
end

return u24