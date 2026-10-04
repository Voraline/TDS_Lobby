-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container
-- Decompile time: 8.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(UI.React)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local createElement = React.createElement
return function(a1) -- Line: 19 -- upvalues: useTransparencyModifier (val), createElement (val), React (val)
    local StrokeGradientTransparency, StrokeTransparency, v1, v2
    local v3 = useTransparencyModifier(a1.Transparency)
    local v4 = {}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v4.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v4.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    v4.BackgroundTransparency = v3(a1.BackgroundTransparency or 1)
    v4.BackgroundColor3 = a1.BackgroundColor3
    v4.BorderSizePixel = a1.BorderSizePixel or 0
    v4.Active = a1.Active
    v4.Visible = a1.Visible
    v4.ClipsDescendants = a1.ClipsDescendants
    v4.Rotation = a1.Rotation
    v4.ZIndex = a1.ZIndex
    v4.LayoutOrder = a1.LayoutOrder
    v4.AutomaticSize = a1.AutomaticSize
    v4.ref = a1.reference
    v4[React.Change.AbsoluteSize] = a1[React.Change.AbsoluteSize]
    v4[React.Event.MouseEnter] = a1[React.Event.MouseEnter]
    v4[React.Event.MouseLeave] = a1[React.Event.MouseLeave]
    v4[React.Event.InputBegan] = a1[React.Event.InputBegan]
    v4[React.Event.InputChanged] = a1[React.Event.InputChanged]
    v4[React.Event.InputEnded] = a1[React.Event.InputEnded]
    local v5 = {children = createElement(React.Fragment, {}, a1.children)}
    local Scale = a1.Scale and createElement("UIScale", {Scale = a1.Scale})
    v5.uiScale = Scale
    local CornerRadiusScale = if a1.CornerRadius then createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)}) else a1.CornerRadiusScale and createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)})
    v5.uiCorner = CornerRadiusScale
    if a1.StrokeColor or a1.StrokeThickness then
        v1 = {
            Color = a1.StrokeColor,
            Thickness = a1.StrokeThickness,
            Transparency = v3(a1.StrokeTransparency),
        }
        v2 = {}
        StrokeGradientTransparency = if a1.StrokeGradientColor or a1.StrokeGradientRotation then createElement("UIGradient", {
            Offset = a1.StrokeGradientOffset,
            Color = a1.StrokeGradientColor,
            Rotation = a1.StrokeGradientRotation,
            Transparency = v3(a1.StrokeGradientTransparency or NumberSequence.new(0)),
        }) else a1.StrokeGradientTransparency and createElement("UIGradient", {
            Offset = a1.StrokeGradientOffset,
            Color = a1.StrokeGradientColor,
            Rotation = a1.StrokeGradientRotation,
            Transparency = v3(a1.StrokeGradientTransparency or NumberSequence.new(0)),
        })
        v2.uiGradient = StrokeGradientTransparency
        StrokeTransparency = createElement("UIStroke", v1, v2)
    else
        StrokeTransparency = a1.StrokeTransparency
        if StrokeTransparency then
            v1 = {
                Color = a1.StrokeColor,
                Thickness = a1.StrokeThickness,
                Transparency = v3(a1.StrokeTransparency),
            }
            v2 = {}
            StrokeGradientTransparency = if a1.StrokeGradientColor or a1.StrokeGradientRotation then createElement("UIGradient", {
                Offset = a1.StrokeGradientOffset,
                Color = a1.StrokeGradientColor,
                Rotation = a1.StrokeGradientRotation,
                Transparency = v3(a1.StrokeGradientTransparency or NumberSequence.new(0)),
            }) else a1.StrokeGradientTransparency and createElement("UIGradient", {
                Offset = a1.StrokeGradientOffset,
                Color = a1.StrokeGradientColor,
                Rotation = a1.StrokeGradientRotation,
                Transparency = v3(a1.StrokeGradientTransparency or NumberSequence.new(0)),
            })
            v2.uiGradient = StrokeGradientTransparency
            StrokeTransparency = createElement("UIStroke", v1, v2)
        end
    end
    v5.uiStroke = StrokeTransparency
    local GradientTransparency = if a1.GradientColor or a1.GradientRotation then createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Offset = a1.GradientOffset,
        Transparency = v3(a1.GradientTransparency or NumberSequence.new(0)),
    }) else a1.GradientTransparency and createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Offset = a1.GradientOffset,
        Transparency = v3(a1.GradientTransparency or NumberSequence.new(0)),
    })
    v5.uiGradient = GradientTransparency
    local AspectRatio = a1.AspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio})
    v5.uiAspectRatio = AspectRatio
    return createElement("Frame", v4, v5)
end