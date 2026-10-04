-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.AdidasEvent.story
-- Decompile time: 1.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
return {
    react = React,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 10 -- upvalues: React (val), Parent (val)
        return React.createElement(Parent, {
            Title = "Backyard Legends",
            EventThumbnail = 95972374540687,
            Size = UDim2.fromOffset(900, 550),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            EventThumbnailPosition = UDim2.fromScale(0.5, 0.5),
            Objectives = {
                {
                    Icon = "rbxassetid://80940287317147",
                    Text = "<font size=\"11\">Adidas Predator Boots</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Complete the Backyard Legends story line across 3 missions.</font><font size=\"3\"><br /></font>",
                },
                {
                    Icon = "rbxassetid://80940287317147",
                    Text = "<font size=\"11\">World Cup Trophy</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Complete quests to earn up to 5 exclusive Adidas skins!</font><font size=\"3\"><br /></font>",
                },
            },
            Buttons = {
                {
                    Text = "Play Event!",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(10, 220, 80),
                },
                {
                    Text = "Skip",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(229, 40, 40),
                },
            },
        })
    end,
}