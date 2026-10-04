-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useChild
-- Decompile time: 1.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local useEvent = require(script.Parent.useEvent)
local u21 = Signal.new()
return function(a1, a2, a3) -- Line: 8
    -- upvalues: React (val), useEvent (val), u21 (val)
    local v1, u13 = React.useState(if not a1 then a3 else a1:FindFirstChild(a2))
    local v2 = {a1, a2}
    useEvent(if not a1 then u21 else a1.ChildAdded, function(a1) -- Line: 12 -- upvalues: a2 (val), u13 (val)
        if a1.Name == a2 then
            u13(a1)
        end
    end, v2)
    v2 = {a1, a2}
    useEvent(if not a1 then u21 else a1.ChildRemoved, function(a1) -- Line: 18 -- upvalues: a2 (val), u13 (val), a3 (val)
        if a1.Name == a2 then
            u13(a3)
        end
    end, v2)
    local v3 = {a1, a2}
    React.useEffect(function() -- Line: 24 -- upvalues: u13 (val), a1 (val), a2 (val), a3 (val)
        u13(if not a1 then a3 else a1:FindFirstChild(a2))
    end, v3)
    return v1
end