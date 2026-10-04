-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePropertyBinding
-- Decompile time: 0.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
return function(a1, a2) -- Line: 8 -- upvalues: useReactBinding (val), useEvent (val) -- types: a1: userdata, a2: string
    local v1, u5 = useReactBinding(a1[a2])
    useEvent(a1:GetPropertyChangedSignal(a2), function() -- Line: 11 -- upvalues: u5 (val), a1 (val), a2 (val)
        u5(a1[a2])
    end)
    return v1
end