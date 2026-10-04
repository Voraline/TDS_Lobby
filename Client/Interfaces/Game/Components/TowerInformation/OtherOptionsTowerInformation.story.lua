-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerInformation.OtherOptionsTowerInformation.story
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OtherOptionsTowerInformation = require(script.Parent.OtherOptionsTowerInformation)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function() -- Line: 9 -- upvalues: createElement (val), OtherOptionsTowerInformation (val)
        return createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(940, 578),
        }, {emptyOtherStats = createElement(OtherOptionsTowerInformation, {plotData = {}})})
    end,
}