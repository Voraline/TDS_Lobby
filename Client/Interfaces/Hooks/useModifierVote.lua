-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useModifierVote
-- Decompile time: 1.30 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useNewNetworkCall = require(ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkCall)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local useCallback = React.useCallback
local useMemo = React.useMemo
local UserId = Players.LocalPlayer.UserId
local StateReplicators = ReplicatedStorage:WaitForChild("StateReplicators")
return function() -- Line: 18
    -- upvalues: useNewNetworkCall (val), useTagReplicatorInstance (val), StateReplicators (val)
    -- upvalues: useReplicatedState (val), useMemo (val), table (val), UserId (val), useCallback (val)
    local u3 = useNewNetworkCall("Modifiers", true)
    local v1 = useTagReplicatorInstance(StateReplicators, "ModifierManager", "ModifierReplicator")
    local u13 = useReplicatedState(v1, "Votes", {})
    local u18 = useReplicatedState(v1, "Locked", nil)
    local v2 = {u13}
    local u23 = useMemo(function() -- Line: 26 -- upvalues: table (upval), u13 (val), UserId (upval)
        local v1 = table.reduce(u13, function(a1, a2, a3) -- Line: 27 -- upvalues: UserId (upval), table (upval)
            if a2[UserId] then
                table.insert(a1, a3)
            end
            return a1
        end, {})
        table.sort(v1)
        return v1
    end, v2)
    local v3 = {u18, u23}
    return u18, u23, (useCallback(function(a1) -- Line: 40 -- upvalues: u18 (val), u23 (val), table (upval), u3 (val)
        if u18 then
            return false, "Voting is currently locked"
        end
        local v1 = {}
        for i, j in u23 do
            if not table.find(a1, j) then
                v1[j] = false
            end
        end
        for k in a1 do
            v1[k] = true
        end
        u3("BulkVoteModifiers", v1)
        return true
    end, v3))
end