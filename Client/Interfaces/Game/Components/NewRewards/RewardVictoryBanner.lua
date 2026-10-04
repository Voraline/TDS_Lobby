-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardVictoryBanner
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 16 -- upvalues: Enum (val), createElement (val) -- types: a1: table
    local v1 = a1.won and ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 238, 0)),
        ColorSequenceKeypoint.new(0.508651, Color3.fromRGB(255, 210, 28)),
        ColorSequenceKeypoint.new(0.513841, Color3.fromRGB(255, 192, 32)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 0))),
    }) or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 29, 70)),
        ColorSequenceKeypoint.new(0.50346, Color3.fromRGB(255, 63, 31)),
        ColorSequenceKeypoint.new(0.512111, Color3.fromRGB(255, 66, 28)),
        ColorSequenceKeypoint.new(0.598616, Color3.fromRGB(255, 114, 33)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 41, 41))),
    })
    local v2 = a1.won and Color3.fromRGB(255, 41, 45) or Color3.new(0, 0, 0)
    local v3 = if not a1.won then "YOU LOST" else "TRIUMPH!"
    if a1.isPVP then
        v3 = (Enum.Team.ToString(a1.team):upper()) .. " WINS!"
        if a1.team == Enum.Team.Blue then
            v2 = Color3.fromRGB(0, 170, 255)
        elseif a1.team == Enum.Team.Red then
            v2 = Color3.fromRGB(255, 0, 0)
        end
    end
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://127765224114156",
        ImageColor3 = v2,
        Position = UDim2.fromScale(-0.0849979, -0.117544),
        Size = UDim2.fromScale(1.16935, 0.252632),
    }, {
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.39),
            Size = UDim2.fromScale(0.624521, 0.7),
            Text = v3,
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 5, Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
            uIGradient = createElement("UIGradient", {Rotation = 90, Color = v1}),
        }),
    })
end)