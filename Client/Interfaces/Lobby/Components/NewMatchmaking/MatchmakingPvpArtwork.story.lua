-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingPvpArtwork.story
-- Decompile time: 2.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local MatchmakingPvpArtwork = require(script.Parent.MatchmakingPvpArtwork)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {Ranked = UILabs.Boolean(false), TeamSize = UILabs.Choose({"1v1", "2v2"})},
    story = function(a1) -- Line: 29
        -- upvalues: createElement (val), MatchmakingStyle (val), MatchmakingPvpArtwork (val)
        return createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = MatchmakingStyle.colors.background,
            Size = UDim2.fromScale(1, 1),
        }, {
            Artwork = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.8),
            }, {
                AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.5}),
                Content = createElement(MatchmakingPvpArtwork, {
                    ranked = a1.controls.Ranked,
                    teamSize = if a1.controls.TeamSize ~= "2v2" then 1 else 2,
                }),
            }),
        })
    end,
}