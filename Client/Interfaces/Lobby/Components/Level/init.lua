-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Level
-- Decompile time: 6.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LevelBar = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Level.LevelBar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local memo = React.memo
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSpring = ReactFlow.useSpring
return (memo(function(a1) -- Line: 21
    -- upvalues: useBinding (val), useGroupAnimation (val), useAnimation (val), Tween (val), Spring (val)
    -- upvalues: useSpring (val), useEffect (val), createElement (val), useMediaQuery (val), LevelBar (val)
    -- upvalues: TextLabel (val)
    local u3 = a1.visible ~= false
    local v1, u14 = useBinding((math.clamp(a1.exp / a1.maxExp, 0, 1)))
    local v2, u55 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.15)}),
            position = Spring({speed = 20, damper = 0.5, target = UDim2.fromScale(0.5, 0.5)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
            position = Spring({speed = 20, damper = 0.5, target = UDim2.fromScale(0.5, 1)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 1)})
    local v3, u59 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v4 = {u3}
    useEffect(function() -- Line: 46 -- upvalues: u55 (val), u3 (val)
        u55(if not u3 then "disable" else "enable")
    end, v4)
    local v5 = useEffect
    v4 = {a1.exp, a1.maxExp}
    v5(function() -- Line: 50 -- upvalues: u14 (val), a1 (val)
        u14((math.clamp(a1.exp / a1.maxExp, 0, 1)))
    end, v4)
    v5 = useEffect
    v4 = {a1.level}
    v5(function() -- Line: 54 -- upvalues: u59 (val)
        u59({force = -800})
    end, v4)
    v4 = {BackgroundTransparency = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 1)
    v4.AnchorPoint = anchorPoint
    v4.Position = a1.position
    local size = a1.size or UDim2.fromScale(0.787, 0.333)
    v4.Size = size
    v4.LayoutOrder = a1.layoutOrder or 0
    v4.Visible = v2.transparency:map(function(a1) -- Line: 65
        return a1 < 1
    end)
    return createElement("Frame", v4, {
        uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 12.5}),
        uiSize = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), if useMediaQuery("large") then 45 else 30)}),
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = v2.position,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            container = createElement(LevelBar, {
                progress = v1,
                transparency = v2.transparency,
                exp = a1.exp,
                maxExp = a1.maxExp,
            }),
            currentLevel = createElement(TextLabel, {
                FontWeight = "Black",
                TextScaled = true,
                StrokeThickness = 2,
                Size = UDim2.fromScale(0.1, 0.583),
                Position = v3:map(function(a1) -- Line: 91
                    return UDim2.fromScale(0, 1 + a1 * 0.01)
                end),
                AnchorPoint = Vector2.yAxis,
                StrokeColor = Color3.fromRGB(21, 56, 94),
                StrokeMode = Enum.ApplyStrokeMode.Contextual,
                StrokeLineJoinMode = Enum.LineJoinMode.Round,
                Text = a1.level,
                Transparency = v2.transparency,
            }, {
                gradient = createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 60, 255)),
                        ColorSequenceKeypoint.new(0.249, Color3.fromRGB(35, 152, 255)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(207, 251, 255))),
                    }),
                }),
                textSize = createElement("UITextSizeConstraint", {MaxTextSize = 28}),
            }),
            nextLevel = createElement(TextLabel, {
                FontWeight = "Black",
                TextScaled = true,
                StrokeThickness = 2,
                Size = UDim2.fromScale(0.1, 0.5),
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.one,
                StrokeColor = Color3.fromRGB(21, 56, 94),
                StrokeMode = Enum.ApplyStrokeMode.Contextual,
                StrokeLineJoinMode = Enum.LineJoinMode.Round,
                Text = a1.level + 1,
                TextColor3 = Color3.fromRGB(148, 177, 202),
                TextTransparency = v2.transparency,
                StrokeTransparency = v2.transparency,
            }, {textSize = createElement("UITextSizeConstraint", {MaxTextSize = 28})}),
            title = createElement(TextLabel, {
                Text = "Lv.",
                TextScaled = true,
                FontWeight = "Black",
                StrokeThickness = 2,
                Size = UDim2.fromScale(0.1, 0.375),
                Position = v3:map(function(a1) -- Line: 137
                    return UDim2.fromScale(0, a1 * 0.01)
                end),
                AnchorPoint = Vector2.zero,
                StrokeColor = Color3.fromRGB(33, 33, 33),
                StrokeLineJoinMode = Enum.LineJoinMode.Round,
                StrokeMode = Enum.ApplyStrokeMode.Contextual,
                Transparency = v2.transparency,
            }, {textSize = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
        }),
    })
end))