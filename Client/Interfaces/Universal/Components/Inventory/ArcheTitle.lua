-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.ArcheTitle
-- Decompile time: 1.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 13 -- upvalues: createElement (val) -- types: a1: table
    local color_2 = nil
    if a1.color then
        color_2 = if typeof(a1.color) ~= "Color3" then a1.color.Keypoints[1].Value else a1.color
    end
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.1, 0.0672858),
        Size = UDim2.fromScale(1, 0.041235),
        Text = a1.title,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = color_2 or Color3.new(1, 1, 1),
    }, {uIStroke = createElement("UIStroke", {Thickness = 2})})
end)