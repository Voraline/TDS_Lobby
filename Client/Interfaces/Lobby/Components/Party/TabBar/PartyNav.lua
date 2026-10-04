-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.TabBar.PartyNav
-- Decompile time: 1.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Navbar = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Navbar)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local TabButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.TabButton)
local createElement = React.createElement
return function(a1) -- Line: 16
    -- upvalues: React (val), PartyContext (val), createElement (val), Navbar (val), TabButton (val)
    local u4 = React.useContext(PartyContext)
    local host = u4.host
    return createElement(Navbar, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0, 0.1),
        Scale = a1.scale,
        OnExitActivated = function() -- Line: 26 -- upvalues: u4 (val)
            u4.setView("Hotbar")
        end,
    }, {
        invites = createElement(TabButton, {
            Icon = "rbxassetid://1595670871",
            LayoutOrder = 1,
            Title = "Invites",
            Size = UDim2.fromScale(3.1245, 0.75),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            OnActivated = function() -- Line: 37 -- upvalues: a1 (val)
                a1.updateWindow("Invites")
            end,
        }),
        party = createElement(TabButton, {
            Icon = "rbxassetid://6319112949",
            LayoutOrder = 0,
            Title = "Party",
            Size = UDim2.fromScale(3.1245, 0.75),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            OnActivated = function() -- Line: 49 -- upvalues: host (val), a1 (val)
                a1.updateWindow(if host == nil then "PartySearch" else "CurrentParty")
            end,
        }),
    })
end