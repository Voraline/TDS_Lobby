-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Title
-- Decompile time: 0.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val)
    return createElement("TextLabel", {
        Text = "Vote For a Difficulty",
        TextSize = 32,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 32),
        Visible = a1.Visible,
    }, {uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.5})})
end