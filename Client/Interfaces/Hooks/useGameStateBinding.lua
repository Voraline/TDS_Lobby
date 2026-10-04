-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGameStateBinding
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local useEvent = require(script.Parent.useEvent)
local useReactBinding = require(script.Parent.useReactBinding)
return function(a1, a2) -- Line: 7 -- upvalues: useReactBinding (val), GameState (val), useEvent (val) -- types: a1: string
    local v1, u8 = useReactBinding(GameState.State[a1] or a2)
    useEvent(GameState.Replicator:GetStateChangedSignal(a1), function(a1) -- Line: 10 -- upvalues: u8 (val)
        u8(a1)
    end)
    return v1
end