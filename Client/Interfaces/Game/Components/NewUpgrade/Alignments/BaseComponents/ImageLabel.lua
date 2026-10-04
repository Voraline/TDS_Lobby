-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.ImageLabel
-- Decompile time: 4.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(UI.React)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local createElement = React.createElement
return function(a1) -- Line: 19 -- upvalues: useTransparencyModifier (val), createElement (val), React (val)
    local v1 = useTransparencyModifier(a1.Transparency)
    local v2 = {}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v2.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v2.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.BackgroundTransparency = v1(a1.BackgroundTransparency or 1)
    v2.LayoutOrder = a1.LayoutOrder
    v2.Visible = a1.Visible
    v2.Rotation = a1.Rotation
    v2.ZIndex = a1.ZIndex
    v2.Selectable = a1.Selectable
    v2.Image = a1.Image
    local ImageColor3 = a1.ImageColor3 or Color3.fromRGB(255, 255, 255)
    v2.ImageColor3 = ImageColor3
    v2.ImageTransparency = v1(a1.ImageTransparency)
    v2.ScaleType = a1.ScaleType
    v2.SliceCenter = a1.SliceCenter
    v2.ImageRectOffset = a1.ImageRectOffset
    v2.ImageRectSize = a1.ImageRectSize
    v2[React.Event.MouseEnter] = a1[React.Event.MouseEnter]
    v2[React.Event.MouseLeave] = a1[React.Event.MouseLeave]
    local v3 = {children = createElement(React.Fragment, {}, a1.children)}
    local CornerRadius = if a1.CornerRadiusScale then createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)}) else a1.CornerRadius and createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)})
    v3.uiCorner = CornerRadius
    local StrokeThickness = if a1.StrokeColor then createElement("UIStroke", {
        Color = a1.StrokeColor,
        Thickness = a1.StrokeThickness,
        LineJoinMode = Enum.LineJoinMode.Bevel,
    }) else a1.StrokeThickness and createElement("UIStroke", {
        Color = a1.StrokeColor,
        Thickness = a1.StrokeThickness,
        LineJoinMode = Enum.LineJoinMode.Bevel,
    })
    v3.uiStroke = StrokeThickness
    local GradientTransparency = if a1.GradientColor or a1.GradientRotation then createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Transparency = v1(a1.GradientTransparency or NumberSequence.new(0)),
    }) else a1.GradientTransparency and createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Transparency = v1(a1.GradientTransparency or NumberSequence.new(0)),
    })
    v3.uiGradient = GradientTransparency
    local AspectRatio = a1.AspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio})
    v3.uiAspectRatio = AspectRatio
    return createElement("ImageLabel", v2, v3)
end