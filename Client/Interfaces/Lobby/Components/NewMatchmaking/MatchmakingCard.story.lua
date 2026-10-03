-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingCard.story
-- Decompile time: 0.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local MatchmakingCard = require(script.Parent.MatchmakingCard)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {Parallax = UILabs.Boolean(true), Sensitivity = UILabs.Slider(2, 0, 4, 0.25)},
    story = function(a1) -- Line: 24
        -- upvalues: createElement (val), MatchmakingStyle (val), MatchmakingCard (val)
        return createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = MatchmakingStyle.colors.background,
            Size = UDim2.fromScale(1, 1),
        }, {
            Card = createElement(MatchmakingCard, {
                image = 122888714711215,
                subtitle = "Move the pointer across the artwork.",
                title = "Easy",
                onActivated = function() end,
                parallaxEnabled = a1.controls.Parallax,
                parallaxSensitivity = a1.controls.Sensitivity,
                size = UDim2.fromOffset(420, 338),
            }),
        })
    end,
}