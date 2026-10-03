-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.TabButton
-- Decompile time: 1.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 18 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = {Text = ""}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0.5)
    v1.AnchorPoint = AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(166, 146, 172)
    v1.ClipsDescendants = true
    local Position = a1.Position or UDim2.fromScale(0, 0.5)
    v1.Position = Position
    v1.Selectable = true
    local Size = a1.Size or UDim2.new(0, 200, 1, 0)
    v1.Size = Size
    v1.LayoutOrder = a1.LayoutOrder
    v1.SizeConstraint = a1.SizeConstraint
    v1[React.Event.Activated] = a1.OnActivated
    local v2 = {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 0,
            Image = a1.Icon,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.12, 1.167),
            Size = UDim2.fromScale(1.333, 1.333),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
        amount = createElement("TextLabel", {
            TextSize = 24,
            TextScaled = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
            (createElement("UIPadding", {PaddingBottom = UDim.new(0.2, 0), PaddingTop = UDim.new(0.2, 0)})),
        }),
    }
    local v3 = createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),
    })
    local v4 = createElement
    local v5 = {CornerRadius = UDim.new(0.125, 0)}
    v2[1] = v3
    v2[2] = v4("UICorner", v5)
    return createElement("TextButton", v1, v2)
end