-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Hitmarker
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local u17 = {10, -10}
return function(a1) -- Line: 15
    -- upvalues: ReactFlow (val), useEffect (val), useBinding (val), u17 (val), createElement (val)
    local v1, v2 = ReactFlow.useTween({
        start = 0,
        target = 1.8,
        info = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    v2({})
    local v3, u21 = ReactFlow.useTween({start = 0, target = 1, info = TweenInfo.new(0.3)})
    useEffect(function() -- Line: 29 -- upvalues: u21 (val)
        task.delay(0.05, function() -- Line: 30 -- upvalues: u21 (upval)
            u21({})
        end)
    end, {})
    return createElement("ImageLabel", {
        Image = "rbxassetid://127658574791295",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(30, 30),
        ImageTransparency = v3,
        Rotation = useBinding(u17[math.random(1, #u17)]),
    }, {uIScale = createElement("UIScale", {Scale = v1})})
end