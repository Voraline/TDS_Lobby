-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Level.LevelBar
-- Decompile time: 5.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Bar = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Level.Bar)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useSpring = ReactFlow.useSpring
local createElement = React.createElement
local useEffect = React.useEffect
local memo = React.memo
local u45 = memo(function(a1) -- Line: 15 -- upvalues: createElement (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = a1.transparency:map(function(a1) -- Line: 18
            return (math.lerp(0.6, 1, a1))
        end),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Size = UDim2.fromScale(0.00847, 1),
    })
end)
local u48 = memo(function(a1) -- Line: 27 -- upvalues: createElement (val), u45 (val), React (val)
    local v1 = {}
    for i = 1, 6 do
        table.insert(v1, (createElement(u45, a1)))
    end
    return createElement("Frame", {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        createElement(React.Fragment, nil, v1),
    })
end)
return (memo(function(a1) -- Line: 49
    -- upvalues: useSpring (val), useEffect (val), createElement (val), u48 (val), Bar (val), TextLabel (val)
    -- upvalues: Comma (val), ImageLabel (val)
    local v1, u4 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v2 = useEffect
    local v3 = {a1.exp}
    v2(function() -- Line: 57 -- upvalues: u4 (val)
        u4({force = -800})
    end, v3)
    v3 = {}
    local size = a1.size or UDim2.fromScale(0.787, 0.333)
    v3.Size = size
    local position = a1.position or UDim2.fromScale(0.5, 0.917)
    v3.Position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 1)
    v3.AnchorPoint = anchorPoint
    v3.BackgroundTransparency = a1.transparency:map(function(a1) -- Line: 67
        return (math.lerp(0.3, 1, a1))
    end)
    v3.BackgroundColor3 = Color3.new(1, 1, 1)
    return createElement("Frame", v3, {
        corner = createElement("UICorner"),
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(74, 74, 74)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))),
            }),
        }),
        stroke = createElement("UIStroke", {
            Thickness = 2,
            Color = Color3.fromRGB(22, 22, 22),
            Transparency = a1.transparency,
        }),
        marker = createElement(u48, {transparency = a1.transparency}),
        bar = createElement(Bar, {progress = a1.progress, transparency = a1.transparency}),
        currentExp = createElement(TextLabel, {
            FontWeight = "Black",
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 1,
            Size = UDim2.fromScale(0.979, 0.9),
            Position = v1:map(function(a1) -- Line: 94
                return UDim2.fromScale(0.5, 0.5 + a1 * 0.01)
            end),
            Text = ("%* Exp"):format(a1.exp),
            TextXAlignment = Enum.TextXAlignment.Left,
            StrokeColor = Color3.fromRGB(0, 0, 0),
            TextTransparency = a1.transparency,
            StrokeTransparency = a1.transparency,
        }, {textSize = createElement("UITextSizeConstraint", {MaxTextSize = 14})}),
        requiredExp = createElement(TextLabel, {
            FontWeight = "Black",
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 1,
            Size = UDim2.fromScale(0.979, 0.9),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = Comma(a1.maxExp),
            TextXAlignment = Enum.TextXAlignment.Right,
            StrokeColor = Color3.fromRGB(0, 0, 0),
            TextTransparency = a1.transparency,
            StrokeTransparency = a1.transparency,
        }, {textSize = createElement("UITextSizeConstraint", {MaxTextSize = 14})}),
        dropShadow = createElement(ImageLabel, {
            Image = "rbxassetid://9239716855",
            BackgroundTransparency = 1,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency:map(function(a1) -- Line: 133
                return (math.lerp(0.2, 1, a1))
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 16, 1, 16),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
    })
end))