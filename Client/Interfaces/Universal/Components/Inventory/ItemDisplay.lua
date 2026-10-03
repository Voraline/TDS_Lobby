-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.ItemDisplay
-- Decompile time: 0.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 10 -- upvalues: createElement (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundColor3 = Color3.new(1, 1, 1),
        Size = UDim2.fromScale(0.204606, 0.099864),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(54, 54, 54))),
            }),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.106667, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.new(1, 1, 1)}),
        chanceRate = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "0.00%",
            TextScaled = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.95),
            Size = UDim2.fromScale(0.7, 0.4),
            TextColor3 = Color3.new(1, 1, 1),
        }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 0.93}),
    })
end))