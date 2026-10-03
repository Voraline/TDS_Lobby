-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.BlackOut
-- Decompile time: 0.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlackOut = require(ReplicatedStorage.Client.Interfaces.Stores.Game.BlackOut)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement

local function render() -- Line: 10
    -- upvalues: ReactCharm (val), BlackOut (val), ReactFlow (val), React (val), createElement (val)
    local u4 = ReactCharm.useSignalState(BlackOut.getState)
    local v1, u14 = ReactFlow.useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v2 = {u4}
    React.useEffect(function() -- Line: 19 -- upvalues: u4 (val), u14 (val)
        u14({target = if not u4.enabled then 1 else 0})
    end, v2)
    return createElement("Frame", {
        BackgroundTransparency = v1,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
end

return function(a1) -- Line: 33 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(999999998)
    return createElement(render)
end