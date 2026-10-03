-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardRank
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.UI.Comma)
require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 22 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {BackgroundColor3 = Color3.fromRGB(38, 38, 38)}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.100000001, 0.5)
    v1.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.04, 0.5)
    v1.Position = position
    local size = a1.size or UDim2.fromScale(0.158, 0.158)
    v1.Size = size
    local sizeConstraint = a1.sizeConstraint or Enum.SizeConstraint.RelativeXX
    v1.SizeConstraint = sizeConstraint
    local v2 = {
        stroke = createElement("UIStroke", {Thickness = 2}),
        corner = createElement("UICorner", {CornerRadius = UDim.new(0.144665, 0)}),
        text = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 30,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 1),
            Text = a1.text,
            TextColor3 = Color3.new(1, 1, 1),
        }, {uIStroke = createElement("UIStroke", {Thickness = 5})}),
    }
    local v3 = {BackgroundTransparency = 1, Image = "rbxassetid://96286062923748", ZIndex = 0}
    local color = a1.color or Color3.fromRGB(255, 170, 0)
    v3.ImageColor3 = color
    v3.Size = UDim2.fromScale(1, 1)
    v2.glow = createElement("ImageLabel", v3)
    return createElement("Frame", v1, v2)
end)