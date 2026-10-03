-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGlobalTrial
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReplicatedState = require(script.Parent.useReplicatedState)
local useTagReplicatorInstance = require(script.Parent.useTagReplicatorInstance)
local StateReplicators = ReplicatedStorage:WaitForChild("StateReplicators")
return function() -- Line: 8 -- upvalues: useTagReplicatorInstance (val), StateReplicators (val), useReplicatedState (val)
    return (useReplicatedState(useTagReplicatorInstance(StateReplicators, "TrialsStateReplicator", "TrialsState"), "GlobalTrial", ""))
end