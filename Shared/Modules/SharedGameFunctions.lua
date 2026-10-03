-- Script path: ReplicatedStorage.Shared.Modules.SharedGameFunctions
-- Decompile time: 11.76 ms

local onNewMap, v1, v2, v3
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v4 = {}
local u18 = RunService:IsClient()
local GameState = require(script.Parent.GameState)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local HermiteCardinalSpline = require(ReplicatedStorage.Shared.Modules.HermiteCardinalSpline)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local TowerClass = if not RunService:IsServer() then require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator) else require(ServerStorage.Server.Modules.TowerClass)
local Towers = workspace:WaitForChild("Towers")
local u68 = {}
for i, j in Enum_2.Team do
    v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    v2 = RaycastParams.new()
    v2.FilterType = Enum.RaycastFilterType.Include
    v3 = RaycastParams.new()
    v3.FilterType = Enum.RaycastFilterType.Exclude
    u68[j] = {whitelistParamsGround = v1, whitelistParamsCliff = v2, blacklistParams = v3}
end
local u80 = {}
local u81 = {}
local u82 = false

local function getBlacklistCharacters() -- Line: 51 -- upvalues: u80 (ref), u81 (val)
    local v1 = table.clone(u80)
    for i, j in u81 do
        table.insert(v1, j)
    end
    return v1
end

local function onPlayerAdded(a1) -- Line: 60 -- upvalues: u81 (val)
    a1.CharacterAdded:Connect(function(a1) -- Line: 61 -- upvalues: u81 (upval)
        table.insert(u81, a1)
    end)
    a1.CharacterRemoving:Connect(function(a1) -- Line: 65 -- upvalues: u81 (upval)
        for k, v in pairs(u81) do
            if v == a1 then
                table.remove(u81, k)
                return
            end
        end
    end)
    if a1.Character then
        table.insert(u81, a1.Character)
    end
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
for k, n in game.Players:GetPlayers() do
    onPlayerAdded(n)
end

function onNewMap(a1) -- Line: 85
    -- upvalues: Enum_2 (val), GameState (val), u18 (val), ReplicatedStorage (val), u82 (ref), MapManager (val)
    -- upvalues: onNewMap (val), u80 (ref), Towers (val), u68 (val)
    local Cliff, Ground, Paths, v1, v2
    local v3 = {[Enum_2.Team.Player] = a1}
    if GameState.GameMode == "PVP" and not u18 then
        local v4 = {}
        v4[Enum_2.Team.Blue] = a1.Blue
        v4[Enum_2.Team.Red] = a1.Red
        v3 = v4
    end
    if u18 then
        local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
        v2 = PlayerReplicator.GetLocalPlayerRaw()
        local Team = v2 and v2.Team or Enum_2.Team.Player
        v3 = {[Team] = a1}
        if not v2 and not u82 then
            u82 = true
            ;(PlayerReplicator.GetLocalPlayer()):andThen(function() -- Line: 107 -- upvalues: u82 (upval), MapManager (upval), onNewMap (upval)
                u82 = false
                local v1 = MapManager.GetLoadedMapRaw()
                if v1 then
                    onNewMap(v1)
                end
            end)
        end
    end
    v2 = nil
    local v5 = nil
    for i, j in v3, v2, v5 do
        Cliff = if not u18 then j:WaitForChild("Cliff") else workspace:WaitForChild("Cliff")
        Ground = if not u18 then j:WaitForChild("Ground") else workspace:WaitForChild("Ground")
        Paths = j:WaitForChild("Paths")
        u80 = {
            Towers,
            if not u18 then nil else workspace:WaitForChild("ClientUnits"),
            workspace.CurrentCamera,
            Paths,
        }
        v1 = u68[i]
        v1.blacklistParams.FilterDescendantsInstances = u80
        v1.whitelistParamsCliff.FilterDescendantsInstances = {Cliff}
        v1.whitelistParamsGround.FilterDescendantsInstances = {Ground}
    end
end

;(MapManager.GetLoadedMap()):andThen(function(a1) -- Line: 150 -- upvalues: onNewMap (val), MapManager (val)
    onNewMap(a1)
    MapManager.MapChanged:Connect(onNewMap)
end)

function v4.StopPlacement() -- Line: 155 -- upvalues: ReplicatedStorage (val)
    require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController):Stop()
end

function v4.GeneratePathFromNodes(a1) -- Line: 160 -- upvalues: HermiteCardinalSpline (val)
    local Magnitude, Magnitude_2, Magnitude_3, v1, v2, v3, v4, v5, v6, v7, v8
    a1:WaitForChild(1)
    local v9 = #a1:GetChildren()
    local v10 = table.create(v9)
    local Position = a1:WaitForChild(1).Position
    table.insert(v10, Position)
    table.insert(v10, Position)
    table.insert(v10, (Position:Lerp((a1:WaitForChild(2)).Position, 0.5)))
    local v11 = {}
    for i = 1, v9 do
        table.insert(v11, (a1:WaitForChild(i)))
    end
    local v12 = v9 - 1
    for j = 2, v12 do
        v7 = a1:WaitForChild(j)
        v8 = a1:WaitForChild(j - 1)
        v1 = a1:WaitForChild(j + 1)
        v7.Transparency = 1
        v8.Transparency = 1
        v1.Transparency = 1
        if v7 and v8 then
            v2 = v7:GetAttribute("CurveIntensity") or 0.25
            v3 = false
            v4 = v7.Position:Lerp(v8.Position, v2)
            if 12 < (v7.Position - v7.Position:Lerp(v8.Position, 0.5)).Magnitude then
                table.insert(v10, v7.Position + (v8.Position - v7.Position).Unit * 10.5)
            end
            Magnitude = (v7.Position - v4).Magnitude
            if (v7.Position - v10[#v10]).Magnitude < 2 then
                table.remove(v10, #v10)
            end
            if not (Magnitude > 2) then
                if not v3 then
                    v3 = true
                    table.insert(v10, v7.Position)
                end
            elseif not (Magnitude < 3) then
                table.insert(v10, v7.Position + (v8.Position - v7.Position).Unit * 3)
            else
                table.insert(v10, v4)
            end
            v5 = v7.Position:Lerp(v1.Position, v2)
            Magnitude_2 = (v7.Position - v5).Magnitude
            if not (Magnitude_2 > 2) then
                if not v3 then
                    table.insert(v10, v7.Position)
                end
            elseif not (Magnitude_2 < 3) then
                table.insert(v10, v7.Position + (v1.Position - v7.Position).Unit * 3)
            else
                table.insert(v10, v5)
            end
            v6 = v7.Position:Lerp(v1.Position, 0.5)
            Magnitude_3 = (v7.Position - v6).Magnitude
            if Magnitude_3 > 12 then
                table.insert(v10, v7.Position + (v1.Position - v7.Position).Unit * 10.5)
            end
            if Magnitude_3 > 24 then
                table.insert(v10, v6)
            end
            continue
        end
        warn(string.format("Path node %s not found in path %s", tostring(j), a1.Name))
        break
    end
    table.insert(v10, (a1:WaitForChild(v9)).Position)
    table.insert(v10, ((a1:WaitForChild(v9 - 1)).Position:Lerp((a1:WaitForChild(v9)).Position, 2)))
    return (HermiteCardinalSpline:ToLinearPath(v10, 0.5, 0.2)), v11, v10
end

local u126 = {}

local function warnOnce(a1) -- Line: 282 -- upvalues: u126 (val)
    if not u126[a1] then
        warn(a1)
        u126[a1] = true
    end
end

function v4.CheckTowerCollisions(a1, a2, a3, a4, a5, a6) -- Line: 289
    -- upvalues: Asset (val), SharedGameConstants (val), u68 (val), u80 (ref), u81 (val), Enum_2 (val), GameState (val)
    -- upvalues: TowerClass (val), u126 (val)
    if not a2 then
        return false
    end
    local v1 = Asset("Troops", a1)
    local v2 = a2 + Vector3.new(0, 5, 0)
    local v3 = a4 or {}
    local Class = v1.Properties.Class
    local BoundarySize = a6 or v1.Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
    local v4 = u68[a3]
    local v5 = table.clone(u80)
    for i, j in u81 do
        table.insert(v5, j)
    end
    v4.blacklistParams.FilterDescendantsInstances = v5
    local whitelistParamsCliff = if Class ~= Enum_2.TowerType.Cliff then v4.whitelistParamsGround else v4.whitelistParamsCliff
    if Class == Enum_2.TowerType.Both then
        whitelistParamsCliff = RaycastParams.new()
        whitelistParamsCliff.FilterType = Enum.RaycastFilterType.Include
        whitelistParamsCliff.FilterDescendantsInstances = {
            v4.whitelistParamsCliff.FilterDescendantsInstances[1],
            v4.whitelistParamsGround.FilterDescendantsInstances[1],
        }
    end
    local v6 = workspace:Raycast(v2, Vector3.new(0, -100, 0), whitelistParamsCliff)
    local v7 = workspace
    local blacklistParams = v4.blacklistParams
    v7 = v7:Raycast(v2, Vector3.new(0, -100, 0), blacklistParams)
    local Quarantine = GameState.IsModifierEnabled("Quarantine")
    if v6 and v7 and v6.Instance == v7.Instance then
        local BoundarySize_2, BoundingBox, BoundingBox_2, HeightOffset, Magnitude, Magnitude_2, WorldPosition, v8, v9, v10
        local v11 = TowerClass.getTowers()
        local v12 = nil
        local v13 = nil
        local v14, v15 = a5, a2
        for k, n in v11, v12, v13 do
            if n ~= v14 and n.Model ~= v14 and n and n.Asset and n.PrimaryPart and n.Model then
                HeightOffset = n.PrimaryPart:FindFirstChild("HeightOffset")
                if not HeightOffset or not HeightOffset:IsA("Attachment") then
                    v10 = "Tower " .. n.Name .. " has no HeightOffset attachment!"
                    if not u126[v10] then
                        warn(v10)
                        u126[v10] = true
                    end
                    BoundingBox, BoundingBox_2 = n.Model:GetBoundingBox()
                    WorldPosition = BoundingBox.Position - Vector3.new(0, BoundingBox_2.Y * 0.5, 0)
                else
                    WorldPosition = HeightOffset.WorldPosition
                end
                if not (SharedGameConstants.BOUNDARY_HEIGHT < (math.abs(WorldPosition.Y - v15.Y))) then
                    Magnitude_2 = (WorldPosition - v6.Position).Magnitude
                    BoundarySize_2 = n.Replicator and n.Replicator:Get("EventBoundarySize") or n.Asset.Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
                    if Quarantine then
                        BoundarySize_2 = BoundarySize_2 + 10
                    end
                    if Magnitude_2 < BoundarySize_2 + BoundarySize then
                        return false, n
                    end
                end
            end
        end
        v12 = nil
        v13 = nil
        for m, i5 in v3, v12, v13 do
            v8 = i5[1]
            v9 = i5[2]
            Magnitude = (v8 - v6.Position).Magnitude
            if Magnitude < (v9 or SharedGameConstants.DEFAULT_BOUNDARY_SIZE) + BoundarySize then
                return false
            end
        end
        return true, v6
    end
    return false
end

function v4.CalculatePlacementPoints(a1, a2, a3) -- Line: 397
    -- upvalues: GameState (val)
    local v1
    local v2 = {}

    local function getValidPoints(a1_2) -- Line: 400 -- upvalues: a1 (val), a2 (val) -- types: a1_2: table
        local v1 = {}
        for i, j in a1_2.Points do
            if (j - a1).Magnitude <= a2 then
                table.insert(v1, j)
            end
        end
        return v1
    end

    for k, v in pairs(GameState.Paths[a3]) do
        if tonumber(k) then
            v1 = getValidPoints(v)
            if not (#v1 <= 0) then
                table.insert(v2, v1)
            end
        end
    end
    return v2
end

function v4.CalculatePlacementDistances(a1, a2, a3) -- Line: 428
    -- upvalues: GameState (val)
    local v1
    local v2 = {}
    local v3 = {}

    local function getValidDistances(a1_2) -- Line: 435 -- upvalues: a1 (val), a2 (val) -- types: a1_2: table
        local ClosestPoint_2
        local v1 = {}
        for i, j in a1_2.Points do
            if (j - a1).Magnitude <= a2 then
                _, ClosestPoint_2 = a1_2:GetClosestPoint(j)
                table.insert(v1, (a1_2:GetDistanceToEnd(ClosestPoint_2)))
            end
        end
        return v1
    end

    for k, v in pairs(GameState.Paths[a3]) do
        if tonumber(k) then
            v1 = getValidDistances(v)
            if not (#v1 <= 0) then
                table.insert(v3, k)
                table.insert(v2, v1)
            end
        end
    end
    return v2, v3
end

function v4.GetClosestPathFromPoint(a1, a2) -- Line: 465
    -- upvalues: GameState (val), Enum_2 (val)
    local ClosestPoint, ClosestPoint_2, Magnitude
    local v1 = GameState.Paths[a1] or GameState.Paths[Enum_2.Team.Player]
    local v2 = (1 / 0)
    local v3 = nil
    local v4 = nil
    local v5 = nil
    local v6 = nil
    for i, j in v1 do
        if tonumber(i) then
            ClosestPoint, ClosestPoint_2 = j:GetClosestPoint(a2)
            Magnitude = (ClosestPoint - a2).Magnitude
            if Magnitude < v2 then
                v5 = i
                v6 = j
                v2 = Magnitude
                v3 = ClosestPoint
                v4 = ClosestPoint_2
            end
        end
    end
    if not v6 then
        return nil
    end
    return {
        path = v6,
        distance = v2,
        position = v3,
        pathToEnd = v4,
        pathName = v5,
    }
end

return v4