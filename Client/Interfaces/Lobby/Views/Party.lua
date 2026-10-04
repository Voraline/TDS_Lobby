-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Party
-- Decompile time: 8.01 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local InviteContainer = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.InviteContainer)
local Party = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local PartyController = require(ReplicatedStorage.Client.Controllers.Lobby.PartyController)
local PartyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.PartyStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(Hooks.useCharmSelector)
local useMediaQuery = require(Hooks.useMediaQuery)
local usePlayerValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerValue)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local useScale = require(Hooks.useScale)
local useView = require(Hooks.useView)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
local u85 = React.memo(function(a1) -- Line: 38
    -- upvalues: useScale (val), useState (val), Players (val), usePooledEvent (val), createElement (val), React (val)
    -- upvalues: Party (val)
    local v1 = useScale(1.5)
    local v2, u10 = useState(Players:GetPlayers())
    usePooledEvent(Players.PlayerAdded, function(a1) -- Line: 42 -- upvalues: u10 (val), Players (upval)
        u10(Players:GetPlayers())
    end)
    usePooledEvent(Players.PlayerRemoving, function(a1) -- Line: 46 -- upvalues: u10 (val), Players (upval)
        u10(Players:GetPlayers())
    end)
    return createElement(React.Fragment, {}, {
        party = createElement(Party, {
            visible = a1.currentView:map(function(a1) -- Line: 52
                return a1 == "Party"
            end),
            scale = v1,
            players = v2,
            friends = a1.friends,
        }),
    })
end, function(a1, a2) -- Line: 60
    return (a1.currentView:getValue()) == a2.currentView:getValue()
end)
local u89 = React.memo(function(a1) -- Line: 64 -- upvalues: useScale (val), createElement (val), InviteContainer (val)
    return createElement(InviteContainer, {invites = a1.invites, isMobile = a1.isMobile, scale = useScale(1.5)})
end, function(a1, a2) -- Line: 70
    return a1.invites == a2.invites
end)
return function() -- Line: 74
    -- upvalues: useCharmSelector (val), PartyStore (val), useState (val), useView (val), useMediaQuery (val)
    -- upvalues: usePlayerValue (val), createElement (val), PartyContext (val), useMemo (val), Players (val)
    -- upvalues: PartyController (val), u85 (val), u89 (val)
    if workspace.Type.Value ~= "Lobby" then
        return nil
    end
    local u8 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 79
        return a1.invites
    end)
    local u13 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 83
        return a1.parties
    end)
    local u18 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 87
        return a1.party
    end)
    local u23 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 91
        return a1.friends
    end)
    local u26, u27 = useState(nil)
    local v1, u31 = useView(true)
    local v2 = useMediaQuery("large", true)
    local u46 = usePlayerValue("Level", u18 and u18.players and u18.players[1], 0)
    local v3 = createElement
    local Provider = PartyContext.Provider
    local v4 = {}
    local v5 = {u8, u18, u26, u13, u46, u23}
    v4.value = useMemo(function() -- Line: 106
        -- upvalues: u18 (val), Players (upval), u46 (val), u26 (val), u8 (val), u13 (val), u23 (val)
        -- upvalues: PartyController (upval), u27 (val), u31 (val)
        local v1 = {
            playerSearchText = "",
            settingsVisible = false,
            host = if not u18 then nil else if not u18.players then nil else u18.players[1],
        }
        v1.isHost = if not u18 or not u18.players then false else u18.players[1] == Players.LocalPlayer
        v1.hostLevel = u46
        v1.players = if not u18 then {} else if not u18.players then {} else u18.players
        v1.invited = if not u26 then {} else u26
        v1.invites = u8
        v1.parties = u13
        v1.friends = u23
        v1.partyParams = u18 and u18.partyParams or {
            partyLocked = true,
            maximumLevel = 1000,
            maxPlayers = 4,
            membersCanInvite = false,
            minimumLevel = 0,
        }
        v1.currentWindow = if not u18 then "PartySearch" else "CurrentParty"

        function v1.createParty() -- Line: 132 -- upvalues: PartyController (upval), u27 (upval)
            local v1 = PartyController:createParty()
            if not v1 then
                return
            end
            u27(v1.invited)
        end

        function v1.leaveParty() -- Line: 140 -- upvalues: PartyController (upval)
            PartyController:leaveParty()
        end

        function v1.invitePlayer(a1) -- Line: 143 -- upvalues: PartyController (upval), u27 (upval)
            if typeof(a1) ~= "Instance" then
                PartyController:inviteFriend(a1)
                return
            end
            local v1 = PartyController:invitePlayer(a1)
            if not v1 then
                return
            end
            u27(v1)
        end

        function v1.setView(a1) -- Line: 156 -- upvalues: u31 (upval) -- types: a1: string
            u31(a1)
        end

        function v1.onUpdateSettingsCallback(a1, a2) -- Line: 159
            -- upvalues: PartyController (upval)
            PartyController:updateSetting(a1, a2)
        end

        function v1.onKickCallback(a1) -- Line: 162 -- upvalues: PartyController (upval) -- types: a1: userdata
            PartyController:kickPlayer(a1)
        end

        function v1.acceptInvite(a1) -- Line: 165
            -- upvalues: PartyController (upval), u27 (upval)
            local v1, v2 = PartyController:acceptInvite(a1)
            if not v1 then
                return
            end
            u27(v2.invited)
        end

        function v1.denyInvite(a1) -- Line: 174 -- upvalues: PartyController (upval) -- types: a1: userdata
            PartyController:declineInvite(a1)
        end

        function v1.joinParty(a1) -- Line: 177 -- upvalues: PartyController (upval) -- types: a1: userdata
            PartyController:joinParty(a1)
        end

        return v1
    end, v5)
    return v3(Provider, v4, {
        party = createElement(u85, {currentView = v1, friends = u23}),
        invites = createElement(u89, {invites = u8, isMobile = not v2:getValue()}),
    })
end