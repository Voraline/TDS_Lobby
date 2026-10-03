-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPStatusPrompt
-- Decompile time: 1.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 15 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {BackgroundTransparency = 0.25, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.5, 0.12)
    v1.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 0.12)
    v1.Size = Size
    v1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    return createElement("Frame", v1, {
        status = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 27,
            TextWrapped = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Text = a1.text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.6})}),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 10, 1, 10),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3}),
        uICorner = createElement("UICorner"),
        uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(500, (1 / 0))}),
    })
end)