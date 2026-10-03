-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionTopBar
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local Arena = require(script.Arena)
local Scale = require(script.Parent.Scale)
local Status = require(script.Status)
local Timer = require(script.Timer)
return function(a1) -- Line: 11 -- upvalues: createElement (val), Status (val), Timer (val), Scale (val), Arena (val)
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local Position = a1.Position or UDim2.fromScale(0.5, 0)
    v1.Position = Position
    v1.Size = UDim2.fromOffset(640, 120)
    local v2 = {
        status = createElement(Status, {StatusText = a1.StatusText}),
        timer = createElement(Timer, {TimeLeft = a1.TimeLeft, TimeLeftConverted = a1.TimeLeftConverted}),
        scale = createElement(Scale, {Max = 1}),
    }
    local IsRanked = a1.IsRanked and a1.IsPVP and a1.ArenaText and createElement(Arena, {
        TextSize = 25,
        HideBanner = true,
        ArenaText = a1.ArenaText,
        Position = UDim2.fromScale(0.5, -0.25),
        Size = UDim2.fromOffset(0, 25),
        PrimaryColor = Color3.fromRGB(161, 255, 200),
        SubColor = Color3.fromRGB(177, 255, 209),
    })
    v2.subStatus = IsRanked
    return createElement("Frame", v1, v2)
end