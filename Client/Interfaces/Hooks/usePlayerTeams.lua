-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerTeams
-- Decompile time: 3.95 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Client.Modules
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local PlayerReplicator = require(Modules.Replicators.PlayerReplicator)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)

local function createEmptyTeams() -- Line: 19 -- upvalues: Enum (val)
    local v1 = {}
    for i, j in Enum.Team do
        v1[j] = {}
    end
    return v1
end

local u42, u43 = Charm.signal(createEmptyTeams(), table.deepCompare)

local function updateTeams() -- Line: 31 -- upvalues: createEmptyTeams (val), PlayerReplicator (val), u43 (val)
    local Player, v1
    local v2 = createEmptyTeams()
    for i in PlayerReplicator.GetPlayers() do
        Player = i.Player
        if Player then
            v1 = v2[i.Team]
            v1[Player] = true
        end
    end
    u43(v2)
end

local function setupPlayer(a1) -- Line: 47
    -- upvalues: PlayerReplicator (val), Players (val), updateTeams (val)
    if PlayerReplicator.WaitForPlayer(a1):timeout(5):await() and a1.Parent == Players then
        updateTeams()
    end
end

;(function() -- Line: 54 -- upvalues: Players (val), setupPlayer (val), u43 (val)
    Players.PlayerAdded:Connect(setupPlayer)
    Players.PlayerRemoving:Connect(function(a1) -- Line: 56 -- upvalues: u43 (upval)
        u43(function(a1_2) -- Line: 57 -- upvalues: a1 (val)
            local v1, v2
            for i, j in a1_2 do
                if j[a1] then
                    v1 = table.clone(a1_2)
                    v2 = table.clone(j)
                    v2[a1] = nil
                    v1[i] = v2
                    return v1
                end
            end
            return a1_2
        end)
    end)
    for i, v in ipairs(Players:GetPlayers()) do
        task.spawn(setupPlayer, v)
    end
end)()
return function() -- Line: 78 -- upvalues: useAtom (val), u42 (val)
    return useAtom(u42)
end