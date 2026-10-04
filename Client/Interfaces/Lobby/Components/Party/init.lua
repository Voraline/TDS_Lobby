-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
-- Decompile time: 3.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local Background = require(Party.Background)
local CreateLeaveButton = require(Party.PlayerSearch.CreateLeaveButton)
local CurrentParty = require(Party.PlayerParty.CurrentParty)
local InviteSearch = require(Party.Invites.InviteSearch)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local PartyNav = require(Party.TabBar.PartyNav)
local PartySearch = require(Party.PartySearch.PartySearch)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useBinding = React.useBinding
local useContext = React.useContext
local useEffect = React.useEffect
return function(a1) -- Line: 26
    -- upvalues: useContext (val), PartyContext (val), useBinding (val), useEffect (val), createElement (val)
    -- upvalues: Background (val), CurrentParty (val), InviteSearch (val), CreateLeaveButton (val), PartySearch (val)
    -- upvalues: PartyNav (val)
    local u3 = useContext(PartyContext)
    local v1, u7 = useBinding(u3.currentWindow)
    local v2 = useEffect
    local v3 = {u3.currentWindow}
    v2(function() -- Line: 30 -- upvalues: u7 (val), u3 (val)
        u7(u3.currentWindow)
    end, v3)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(1024, 512),
        Visible = a1.visible,
    }, {
        background = createElement(Background),
        currentParty = createElement(CurrentParty, {currentWindow = v1, players = a1.players, friends = u3.friends}),
        inviteSearch = createElement(InviteSearch, {currentWindow = v1}),
        createLeaveButton = createElement(CreateLeaveButton),
        partySearch = createElement(PartySearch, {
            visible = v1:map(function(a1) -- Line: 54
                return a1 == "PartySearch"
            end),
        }),
        tabs = createElement(PartyNav, {scale = a1.scale, updateWindow = u7}),
        uiScale = createElement("UIScale", {Scale = a1.scale}),
    })
end