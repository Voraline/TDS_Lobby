-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Lock
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val)
    return createElement("ImageLabel", {
        Image = "rbxassetid://16727369592",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, -16),
        Size = UDim2.fromOffset(64, 64),
        Visible = a1.Locked,
    }, {
        textLabel = createElement("TextLabel", {
            TextSize = 22,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = ("Level %*"):format(a1.LevelRequired),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 1, 8),
            Size = UDim2.fromOffset(200, 24),
        }),
    })
end