-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAspectRatio
-- Decompile time: 0.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useViewportSize = require(script.Parent.useViewportSize)
return function() -- Line: 5 -- upvalues: React (val), useViewportSize (val)
    local v1, u4 = React.useState(1)
    local u6 = useViewportSize()
    local v2 = {u6}
    React.useEffect(function() -- Line: 9 -- upvalues: u6 (val), u4 (val)
        u4((math.min(((Vector2.new(1920, 1080)) / u6).Y * 1.1, 1)))
    end, v2)
    return v1
end