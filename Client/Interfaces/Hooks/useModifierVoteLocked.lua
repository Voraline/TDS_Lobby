-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useModifierVoteLocked
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local StateReplicators = ReplicatedStorage:WaitForChild("StateReplicators")
return function() -- Line: 9 -- upvalues: useTagReplicatorInstance (val), StateReplicators (val), useReplicatedState (val)
    return useReplicatedState(useTagReplicatorInstance(StateReplicators, "ModifierReplicator", "ModifierManager"), "Locked", nil) == true
end