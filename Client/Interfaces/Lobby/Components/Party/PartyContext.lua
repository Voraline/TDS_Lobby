-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext
-- Decompile time: 1.04 ms

return (require((game:GetService("ReplicatedStorage")).Shared.UI.React)).createContext({
    isHost = false,
    hostLevel = 1,
    playerSearchText = "",
    settingsVisible = false,
    players = {},
    invited = {},
    invites = {},
    parties = {},
    partyParams = {
        partyLocked = true,
        maximumLevel = 1000,
        maxPlayers = 4,
        membersCanInvite = false,
        minimumLevel = 0,
    },
    createParty = function() end,
    leaveParty = function() end,
    invitePlayer = function() end,
    setView = function() end,
    onUpdateSettingsCallback = function() end,
    onKickCallback = function() end,
    acceptInvite = function() end,
    denyInvite = function() end,
    joinParty = function() end,
})