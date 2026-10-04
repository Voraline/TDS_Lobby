-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.CurrentParty
-- Decompile time: 3.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local Host = require(Party.PlayerParty.Host)
local HostSettings = require(Party.PlayerParty.HostSettings)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local PartyMembers = require(Party.PlayerParty.PartyMembers)
local PartyTitle = require(Party.PlayerParty.PartyTitle)
local ServerList = require(Party.PlayerSearch.ServerList)
local SettingsIcon = require(Party.PlayerParty.SettingsIcon)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useContext = React.useContext
return function(a1) -- Line: 20
    -- upvalues: useContext (val), PartyContext (val), useBinding (val), useEffect (val), createElement (val)
    -- upvalues: Host (val), HostSettings (val), PartyMembers (val), PartyTitle (val), ServerList (val)
    -- upvalues: SettingsIcon (val)
    local u3 = useContext(PartyContext)
    local v1, u11 = useBinding(u3.currentWindow == "CurrentParty")
    local v2, u16 = useBinding(u3.settingsVisible)
    local v3 = useEffect
    local v4 = {u3.settingsVisible, u3.currentWindow}
    v3(function() -- Line: 26 -- upvalues: u16 (val), u3 (val), u11 (val)
        u16(u3.settingsVisible)
        u11(u3.currentWindow == "CurrentParty")
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(0, 896, 1, 0),
        Visible = a1.currentWindow:map(function(a1) -- Line: 39
            return a1 == "CurrentParty"
        end),
    }, {
        host = createElement(Host, {visible = v1}),
        hostSettings = createElement(HostSettings, {visible = v2}),
        partyMembers = createElement(PartyMembers),
        partyTitle = createElement(PartyTitle),
        serverList = createElement(ServerList, {settingsVisible = v2, players = a1.players}),
        settingsIcon = createElement(SettingsIcon, {updateSettingsVisible = u16, settingsVisible = v2}),
    })
end