-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartySearch.PartySearch
-- Decompile time: 7.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local PartyResult = require(Party.PartySearch.PartyResult)
local React = require(ReplicatedStorage.Shared.UI.React)
local SearchBox = require(Party.SearchBox)
require(ReplicatedStorage.Client.Controllers.Lobby.PartyController.types)
local createElement = React.createElement
local useMemo = React.useMemo
local useState = React.useState

local function createParties(a1, a2, a3) -- Line: 20
    -- upvalues: useMemo (val), createElement (val), PartyResult (val)
    return useMemo(function() -- Line: 21 -- upvalues: a1 (val), a3 (val), a2 (val), createElement (upval), PartyResult (upval)
        local DisplayName, partyLocked, partyParams, players
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1, v2, v3 do
            players = j.players and j.players[1]
            DisplayName = players.DisplayName
            partyParams = j.partyParams
            partyLocked = partyParams and partyParams.partyLocked
            if not a3 and not partyLocked and not (partyParams.maxPlayers <= #j.players) then
                if a2 == "" or string.match(DisplayName:lower(), a2:lower()) then
                    table.insert(v1, (createElement(PartyResult, {party = j})))
                end
            end
        end
        return v1
    end, {a1, a2, a3})
end

return function(a1) -- Line: 49
    -- upvalues: React (val), PartyContext (val), useState (val), createElement (val), createParties (val)
    -- upvalues: SearchBox (val)
    local v1 = React.useContext(PartyContext)
    local parties = v1.parties
    local v2, u9 = useState("")
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(0, 896, 1, 0),
        Visible = a1.visible,
    }, {
        uiGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.65, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        parties = createElement("Frame", {
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(640, 384),
        }, {
            list = createElement("ScrollingFrame", {
                BottomImage = "rbxassetid://6275896591",
                MidImage = "rbxassetid://6275893557",
                TopImage = "rbxassetid://6275890853",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Selectable = false,
                ZIndex = 2,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ElasticBehavior = Enum.ElasticBehavior.Never,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.new(1, 20, 1, -16),
                CanvasSize = UDim2.fromScale(0, 0),
            }, {
                uiListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
                searchResults = React.createElement(React.Fragment, nil, createParties(parties, v2, v1.isHost)),
            }),
            searchBox = createElement(SearchBox, {
                zIndex = 3,
                placeholderText = "Enter a party name",
                position = UDim2.fromOffset(0, -32),
                size = UDim2.fromOffset(240, 24),
                onTextChanged = function(a1) -- Line: 124 -- upvalues: u9 (val) -- types: a1: string
                    u9(a1)
                end,
            }),
        }),
    })
end