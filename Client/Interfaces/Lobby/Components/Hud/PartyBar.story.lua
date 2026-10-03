-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.PartyBar.story
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local PartyBar = require(script.Parent.PartyBar)
local createElement = React.createElement
local u25 = {
    {Name = "Test Player 69492859", UserId = 69492859},
    {Name = "Test Player 16983447", UserId = 16983447},
    {Name = "Test Player 11643", UserId = 11643},
    {Name = "Test Player 49601674", UserId = 49601674},
}
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        Layout = UILabs.Choose({"horizontal", "vertical"}),
        MemberCount = UILabs.Slider(2, 1, 4, 1),
        Phone = UILabs.Boolean(false),
        Visible = UILabs.Boolean(true),
    },
    story = function(a1) -- Line: 51 -- upvalues: u25 (val), createElement (val), PartyBar (val) -- types: a1: table
        local v1 = {}
        local MemberCount = a1.controls.MemberCount
        for i = 1, MemberCount do
            v1[i] = u25[i]
        end
        return createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(7, 13, 18),
            Size = UDim2.fromScale(1, 1),
        }, {
            PartyBar = createElement(PartyBar, {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Visible = a1.controls.Visible,
                clicked = function() end,
                layout = a1.controls.Layout,
                leader = v1[1],
                members = v1,
                phone = a1.controls.Phone,
                showAddButton = #v1 < 4,
            }),
        })
    end,
}