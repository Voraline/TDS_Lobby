-- Script path: ReplicatedStorage.Client.Modules.Replicators.PathReplicator
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local NPCReplicator = require(script.Parent.NPCReplicator)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Modules.SharedGameFunctions)
require(ReplicatedStorage.Client.Modules.TagReplicator)
local HermiteCardinalSpline = require(ReplicatedStorage.Shared.Modules.HermiteCardinalSpline)
require(ReplicatedStorage.Shared.Modules.LinearPath)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local StatePaths = Network.Channel("StatePaths")

local function update(a1) -- Line: 60 -- upvalues: GameState (val), HermiteCardinalSpline (val) -- types: a1: table
    local v1, v2
    GameState.Paths = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        GameState.Paths[i] = {}
        for k, n in j do
            v1 = HermiteCardinalSpline:ToLinearPath(n, 0.5, 0.2)
            v2 = GameState.Paths[i]
            v2[tonumber(k) or k] = v1
        end
    end
end

local function refresh() -- Line: 72 -- upvalues: StatePaths (val), update (val)
    local v1 = StatePaths:InvokeServer("RequestPaths")
    local v2 = {}
    for i, j in v1 do
        v2[tonumber(i) or i] = j
    end
    update(v1)
end

MapManager.MapChanged:Connect(function() -- Line: 84 -- upvalues: refresh (val)
    task.spawn(function() -- Line: 85 -- upvalues: refresh (upval)
        local success, result = pcall(refresh)
        if not success then
            warn((("Failed to refresh paths: %*"):format(result)))
        end
    end)
end)
StatePaths:On("UpdatePaths", update)
StatePaths:On("UpdatePath", function(a1, a2, a3, a4) -- Line: 101
    -- upvalues: GameState (val), HermiteCardinalSpline (val), NPCReplicator (val)
    if not GameState.Paths[a1] then
        GameState.Paths[a1] = {}
    end
    local v1 = GameState.Paths[a1][tonumber(a2) or a2]
    local v2 = HermiteCardinalSpline:ToLinearPath(a3, 0.5, 0.2)
    local v3 = GameState.Paths[a1]
    v3[tonumber(a2) or a2] = v2
    NPCReplicator.RefreshAllNPCsByPath(v1, a4)
end)
if MapManager.GetLoadedMapRaw() then
    task.spawn(function() -- Line: 85 -- upvalues: refresh (val)
        local success, result = pcall(refresh)
        if not success then
            warn((("Failed to refresh paths: %*"):format(result)))
        end
    end)
end
return {}