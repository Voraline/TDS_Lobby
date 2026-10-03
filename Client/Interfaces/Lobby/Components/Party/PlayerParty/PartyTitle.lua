-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.PartyTitle
-- Decompile time: 0.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement

local function setTitle(a1) -- Line: 10
    if a1.players and a1.players[1] then
        return (("%*'s Party (%*/%*)"):format(a1.players[1].DisplayName, #a1.players, a1.partyParams.maxPlayers))
    end
    return ""
end

return function() -- Line: 20 -- upvalues: React (val), PartyContext (val), createElement (val), TextLabel (val)
    local v1 = React.useContext(PartyContext)
    return createElement(TextLabel, {
        FontWeight = "Heavy",
        TextScaled = true,
        TextWrapped = true,
        StrokeThickness = 2,
        StrokeTransparency = 0.5,
        Text = if not v1.players then "" else if v1.players[1] then ("%*'s Party (%*/%*)"):format(v1.players[1].DisplayName, #v1.players, v1.partyParams.maxPlayers) else "",
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.fromOffset(345, 20),
        Position = UDim2.fromScale(0, 0.07),
        AnchorPoint = Vector2.zero,
    })
end