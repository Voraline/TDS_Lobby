-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePrimaryPart
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local useEffect = React.useEffect
local useEvent = require(script.Parent.useEvent)
local u22 = Signal.new()
return function(a1, a2) -- Line: 11
    -- upvalues: React (val), useEvent (val), u22 (val), useEffect (val)
    local v1, u9 = React.useState(if not a1 then a2 else a1.PrimaryPart)
    local v2 = {a1}
    useEvent(if not a1 then u22 else a1:GetPropertyChangedSignal("PrimaryPart"), function() -- Line: 16 -- upvalues: a1 (val), u9 (val)
        if a1 then
            u9(a1.PrimaryPart)
        end
    end, v2)
    local v3 = {a1}
    useEffect(function() -- Line: 24 -- upvalues: u9 (val), a1 (val), a2 (val)
        u9(if not a1 then a2 else a1.PrimaryPart)
    end, v3)
    return v1
end