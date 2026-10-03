-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartySearch.PartyResult
-- Decompile time: 2.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local JoinButton = require(Party.PartySearch.JoinButton)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local PartyLevelCap = require(Party.PartySearch.PartyLevelCap)
local PlayerIcon = require(Party.PartySearch.PlayerIcon)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useContext = React.useContext

local function createPlayers(a1) -- Line: 16 -- upvalues: React (val), createElement (val), PlayerIcon (val)
    return React.useMemo(function() -- Line: 17 -- upvalues: a1 (val), createElement (upval), PlayerIcon (upval)
        local Level, Value
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1, v2, v3 do
            Level = j:FindFirstChild("Level")
            Value = Level and Level.Value or "???"
            table.insert(v1, (createElement(PlayerIcon, {userId = j.UserId, level = Value})))
        end
        return v1
    end, {a1})
end

return function(a1) -- Line: 36
    -- upvalues: useContext (val), PartyContext (val), createElement (val), JoinButton (val), React (val)
    -- upvalues: createPlayers (val), TextLabel (val), PartyLevelCap (val)
    local u3 = a1.party.players[1]
    local u6 = useContext(PartyContext)
    return createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(7, 7, 7),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -20, 0, 128),
    }, {
        join = createElement(JoinButton, {
            party = a1.party,
            host = u3,
            onClick = function() -- Line: 50 -- upvalues: u6 (val), u3 (val)
                u6.joinParty(u3)
            end,
        }),
        partyMembers = createElement("Frame", {
            BackgroundTransparency = 0.85,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 32, 0.5, 16),
            Size = UDim2.fromOffset(352, 80),
        }, {
            players = React.createElement(React.Fragment, nil, createPlayers(a1.party.players)),
            uiGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0.25),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.8, 0.25),
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
        }),
        partyHeader = createElement(TextLabel, {
            FontWeight = "Heavy",
            TextScaled = true,
            TextWrapped = true,
            StrokeThickness = 2,
            BackgroundTransparency = 0,
            Text = ("%*'s Party (%*/%*)"):format(u3.DisplayName, #a1.party.players, a1.party.partyParams.maxPlayers),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, 0, 0, 32),
            AnchorPoint = Vector2.zero,
            BackgroundColor3 = Color3.fromRGB(255, 170, 0),
            Position = UDim2.fromScale(0, 0),
        }, {
            levelCap = createElement(PartyLevelCap, {party = a1.party}),
            uiPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 4),
            }),
        }),
        uiGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.65, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
end