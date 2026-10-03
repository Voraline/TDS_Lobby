-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.Winter2024Event.story
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
return {
    react = React,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 10 -- upvalues: React (val), Parent (val)
        return React.createElement(Parent, {
            Title = "Frost Invasion",
            Size = UDim2.fromOffset(900, 550),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Objectives = {
                {
                    Icon = "rbxassetid://110281184700921",
                    Text = "<font size=\"9\">Frost Spirit has returned to TDS!</font><font size=\"2\"><br /><br /></font><font size=\"7\" weight=\"800\">Complete the Frost Invasion event mission on Easy difficulty.</font><font size=\"3\"><br /></font>",
                },
                {
                    Icon = "rbxassetid://131996663705871",
                    Text = "<font size=\"11\">Challenge Frost Spirit in his true form.</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Find the shards, enter the code, and hold your ground against a vengeful spirit.</font><font size=\"3\"><br /></font>",
                },
            },
        })
    end,
}