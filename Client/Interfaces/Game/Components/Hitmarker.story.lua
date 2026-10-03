-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Hitmarker.story
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hitmarker = require(script.Parent.Hitmarker)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), Hitmarker (val)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {hitmarker = React.createElement(Hitmarker, {})})
end

return function(a1) -- Line: 18 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 23 -- upvalues: u4 (val)
        u4:unmount()
    end
end