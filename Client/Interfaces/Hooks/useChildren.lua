-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useChildren
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local useEvent = require(script.Parent.useEvent)
local u21 = Signal.new()
return function(a1) -- Line: 8 -- upvalues: React (val), useEvent (val), u21 (val) -- types: a1: userdata?
    local v1, u10 = React.useState(if not a1 then {} else a1:GetChildren())
    local v2 = {a1}
    useEvent(if not a1 then u21 else a1.ChildAdded, function(a1_2) -- Line: 11 -- upvalues: u10 (val), a1 (val)
        u10(if not a1 then {} else a1:GetChildren())
    end, v2)
    v2 = {a1}
    useEvent(if not a1 then u21 else a1.ChildRemoved, function(a1_2) -- Line: 15 -- upvalues: u10 (val), a1 (val)
        u10(if not a1 then {} else a1:GetChildren())
    end, v2)
    local v3 = {a1}
    React.useEffect(function() -- Line: 19 -- upvalues: u10 (val), a1 (val)
        u10(if not a1 then {} else a1:GetChildren())
    end, v3)
    return v1
end