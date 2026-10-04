-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPing.SuggestionPing.story
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local CurrentCamera = workspace.CurrentCamera
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        Lifetime = 10,
        Header = "UPGRADE!",
        RequesterName = "Player1",
        Radius = 3.75,
        Color = Color3.fromRGB(1, 162, 255),
    },
    story = function(a1) -- Line: 24 -- upvalues: createPortal (val), createElement (val), Parent (val), CurrentCamera (val)
        return createPortal(createElement("Folder", {Name = "Pings"}, {
            SuggestionPing = createElement(Parent, {
                position = Vector3.new(0, 0, 0),
                imageId = 16742136020,
                header = a1.controls.Header,
                requesterName = a1.controls.RequesterName,
                endTimestamp = (workspace:GetServerTimeNow()) + a1.controls.Lifetime,
                radius = a1.controls.Radius,
                color = a1.controls.Color,
            }),
        }), CurrentCamera)
    end,
}