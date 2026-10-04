-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.HuntEvent.story
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
return {
    react = React,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 10 -- upvalues: React (val), Parent (val)
        return React.createElement(Parent, {
            Title = "The Hunt: Mega Edition",
            EventThumbnail = 80684444601566,
            Size = UDim2.fromOffset(900, 550),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            EventThumbnailPosition = UDim2.fromScale(0.5, 1.55),
            Objectives = {
                {
                    Icon = "rbxassetid://91048211859838",
                    Text = "<font size=\"9\">Korblox Token</font><font size=\"2\"><br /><br /></font><font size=\"7\" weight=\"800\">Repel the vengeful empire on Easy difficulty.</font><font size=\"3\"><br /></font>",
                },
                {
                    Icon = "rbxassetid://91048211859838",
                    Text = "<font size=\"11\">Sigil of the Deathwalker</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Following whispers of an ancient power, the path to vengeance is complete.</font><font size=\"3\"><br /></font>",
                },
            },
        })
    end,
}