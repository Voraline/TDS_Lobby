-- Script path: ReplicatedStorage.Shared.Modules.TeamOctrees
-- Decompile time: 2.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Octree = require(ReplicatedStorage.Shared.Modules.Octree)
local u16 = {}
u16[Enum.Team.Player] = Enum.Team.Enemy
u16[Enum.Team.Enemy] = Enum.Team.Player
u16[Enum.Team.Red] = Enum.Team.Blue
u16[Enum.Team.Blue] = Enum.Team.Red
for i, j in u16 do
    u16[j] = i
end
local u43 = {}
for k, n in Enum.Team do
    u43[n] = (Octree.new())
end

function v1.registerEntity(a1) -- Line: 38 -- upvalues: u43 (val)
    assert(a1.Team, "Entity does not have a team")
    assert(a1.Position, "Entity does not have a position")
    assert(a1.Maid, "Entity does not have a maid")
    assert(u43[a1.Team], (string.format("Team %s is not a valid team", a1.Team)))
    local v1 = u43[a1.Team]:CreateNode(a1.Position, a1)
    a1.Maid:Mark(v1)
    return v1
end

function v1.getAggroTeam(a1) -- Line: 50 -- upvalues: u16 (val) -- types: a1: number
    return u16[a1]
end

function v1.getTeamOctree(a1) -- Line: 54 -- upvalues: u43 (val) -- types: a1: number
    return u43[a1]
end

function v1.getTargets(a1, a2, a3) -- Line: 65
    -- upvalues: u16 (val), u43 (val)
    local v1 = Vector3.new(a2.X, 0, a2.Z)
    assert(u16[a1], "Team " .. (tostring(a1)) .. " does not have aggro data")
    assert(u43[u16[a1]], "Team " .. (tostring(u16[a1])) .. " does not have an octree")
    return u43[u16[a1]]:RadiusSearch(v1, a3)
end

function v1.getKNearestTargets(a1, a2, a3, a4) -- Line: 83
    -- upvalues: u16 (val), u43 (val)
    local v1 = Vector3.new(a3.X, 0, a3.Z)
    assert(u16[a1], "Team " .. (tostring(a1)) .. " does not have aggro data")
    assert(u43[u16[a1]], "Team " .. (tostring(u16[a1])) .. " does not have an octree")
    return u43[u16[a1]]:KNearestNeighborsSearch(v1, a2, a4)
end

function v1.getTeammates(a1, a2, a3) -- Line: 100 -- upvalues: u43 (val) -- types: a1: number, a2: vector, a3: number
    local v1 = Vector3.new(a2.X, 0, a2.Z)
    assert(u43[a1], "Team " .. (tostring(a1)) .. " does not have an octree")
    return u43[a1]:RadiusSearch(v1, a3)
end

function v1.getNodesFromPart(a1, a2) -- Line: 112 -- upvalues: u43 (val) -- types: a1: number, a2: userdata
    assert(u43[a1], "Team " .. (tostring(a1)) .. " does not have an octree")
    return u43[a1]:GetNodesFromPart(a2)
end

return v1