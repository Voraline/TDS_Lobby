-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.InnovationAwards.story
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local InnovationTeleportConfig = require(ReplicatedStorage.Client.Interfaces.Lobby.InnovationTeleportConfig)
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function() -- Line: 12 -- upvalues: React (val), Parent (val), InnovationTeleportConfig (val)
        return React.createElement(Parent, {
            Title = "Vote for TDS!",
            Size = UDim2.fromOffset(900, 550),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            EventThumbnail = InnovationTeleportConfig.DestinationThumbnail,
            EventThumbnailPosition = UDim2.fromScale(0.5, 0.5),
            Objectives = {
                {
                    Text = "<font size=\"11\">Support Tower Defense Simulator</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Visit The Block and vote for TDS in the Innovation Awards!</font><font size=\"3\"><br /></font>",
                    Icon = InnovationTeleportConfig.ObjectiveIcon,
                },
                {
                    Text = "<font size=\"11\">Cast Your Vote</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Select Vote Now to teleport directly to the voting experience.</font><font size=\"3\"><br /></font>",
                    Icon = InnovationTeleportConfig.ObjectiveIcon,
                },
            },
            Buttons = {
                {
                    Text = "Vote Now!",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(10, 220, 80),
                },
                {
                    Text = "Not Now",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(229, 40, 40),
                },
            },
        })
    end,
}