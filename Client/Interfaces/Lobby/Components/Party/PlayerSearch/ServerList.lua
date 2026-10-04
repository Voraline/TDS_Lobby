-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerSearch.ServerList
-- Decompile time: 1.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local SearchBox = require(Party.SearchBox)
local ServerPlayers = require(Party.PlayerSearch.ServerPlayers)
local createElement = React.createElement
local useState = React.useState
local useContext = React.useContext
return function(a1) -- Line: 20
    -- upvalues: useContext (val), PartyContext (val), useState (val), createElement (val), SearchBox (val)
    -- upvalues: ServerPlayers (val)
    local v1, u7 = useState((useContext(PartyContext)).playerSearchText)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.47, 0),
        Size = UDim2.new(0, 896, 1, 0),
        Visible = a1.settingsVisible:map(function(a1) -- Line: 32
            return not a1
        end),
    }, {
        searchBox = createElement(SearchBox, {
            PlaceholderText = "Enter a player name",
            onTextChanged = function(a1) -- Line: 39 -- upvalues: u7 (val) -- types: a1: string
                u7(a1)
            end,
        }),
        serverPlayers = createElement(ServerPlayers, {searchText = v1, players = a1.players}),
    })
end