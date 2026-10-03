-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.TextLabel
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(UI.React)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local createElement = React.createElement
local u17 = {Black = "Heavy"}
return function(a1) -- Line: 24 -- upvalues: useTransparencyModifier (val), createElement (val), u17 (val), React (val)
    local StrokeLineJoinMode, StrokeThickness, v1
    local v2 = useTransparencyModifier(a1.Transparency)
    local v3 = {}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v3.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v3.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = AnchorPoint
    v3.BackgroundTransparency = v2(a1.BackgroundTransparency or 1)
    local BackgroundColor3 = a1.BackgroundColor3 or Color3.fromRGB(255, 255, 255)
    v3.BackgroundColor3 = BackgroundColor3
    v3.Visible = a1.Visible
    v3.Rotation = a1.Rotation
    v3.ZIndex = a1.ZIndex
    v3.LayoutOrder = a1.LayoutOrder
    v3.AutomaticSize = a1.AutomaticSize
    v3.TextScaled = a1.TextScaled ~= false
    v3.TextWrapped = a1.TextWrapped
    v3.TextTruncate = a1.TextTruncate
    v3.TextSize = a1.TextSize
    v3.TextTransparency = v2(a1.TextTransparency)
    v3.Text = a1.Text or ""
    local TextColor3 = a1.TextColor3 or Color3.fromRGB(255, 255, 255)
    v3.TextColor3 = TextColor3
    local TextXAlignment = a1.TextXAlignment or Enum.TextXAlignment.Center
    v3.TextXAlignment = TextXAlignment
    local TextYAlignment = a1.TextYAlignment or Enum.TextYAlignment.Center
    v3.TextYAlignment = TextYAlignment
    v3.RichText = a1.RichText
    local FontWeight = a1.FontWeight and Font.fromName(a1.Font or "Montserrat", Enum.FontWeight[u17[a1.FontWeight] or a1.FontWeight])
    v3.FontFace = FontWeight
    local v4 = {children = createElement(React.Fragment, {}, a1.children)}
    local CornerRadius = a1.CornerRadius and createElement("UICorner", {CornerRadius = UDim.new(0, a1.CornerRadius)})
    v4.uiCorner = CornerRadius
    if a1.StrokeColor then
        v1 = {
            Color = a1.StrokeColor,
            Thickness = a1.StrokeThickness,
            Transparency = v2(a1.StrokeTransparency),
            ApplyStrokeMode = a1.StrokeMode,
        }
        StrokeLineJoinMode = a1.StrokeLineJoinMode or Enum.LineJoinMode.Bevel
        v1.LineJoinMode = StrokeLineJoinMode
        StrokeThickness = createElement("UIStroke", v1)
    else
        StrokeThickness = a1.StrokeThickness
        if StrokeThickness then
            v1 = {
                Color = a1.StrokeColor,
                Thickness = a1.StrokeThickness,
                Transparency = v2(a1.StrokeTransparency),
                ApplyStrokeMode = a1.StrokeMode,
            }
            StrokeLineJoinMode = a1.StrokeLineJoinMode or Enum.LineJoinMode.Bevel
            v1.LineJoinMode = StrokeLineJoinMode
            StrokeThickness = createElement("UIStroke", v1)
        end
    end
    v4.uiStroke = StrokeThickness
    return createElement("TextLabel", v3, v4)
end