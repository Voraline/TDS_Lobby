-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.DisplayTitle
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 12 -- upvalues: createElement (val) -- types: a1: table
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.1, 0),
        Size = UDim2.fromScale(1, 0.068347),
        Text = a1.title,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {uIStroke = createElement("UIStroke", {Thickness = 2})})
end)