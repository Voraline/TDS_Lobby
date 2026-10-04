-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.InviteSearch
-- Decompile time: 5.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local ListInvite = require(Party.Invites.ListInvite)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local SearchBox = require(Party.SearchBox)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo

local function createInvites(a1, a2) -- Line: 14
    -- upvalues: useMemo (val), createElement (val), ListInvite (val)
    return useMemo(function() -- Line: 15 -- upvalues: a2 (val), a1 (val), createElement (upval), ListInvite (upval)
        local Level, Name, Value
        local v1 = {}
        local v2 = a2
        local v3 = nil
        local v4 = nil
        for i, j in a1, v3, v4 do
            Name = j.Name
            if v2 == "" or string.match(Name:lower(), v2:lower()) then
                Level = j:FindFirstChild("Level")
                Value = Level and Level.Value or 0
                table.insert(v1, (createElement(ListInvite, {
                    player = j,
                    displayName = j.DisplayName,
                    userId = j.UserId,
                    level = Value,
                })))
            end
        end
        return v1
    end, {a1, a2})
end

return function(a1) -- Line: 43
    -- upvalues: React (val), PartyContext (val), useState (val), createElement (val), createInvites (val)
    -- upvalues: SearchBox (val)
    local invites = (React.useContext(PartyContext)).invites
    local v1, v2 = useState("")
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(0, 896, 1, 0),
        Visible = a1.currentWindow:map(function(a1) -- Line: 58
            return a1 == "Invites"
        end),
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
        invitesList = createElement("Frame", {
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
                invites = React.createElement(React.Fragment, nil, createInvites(invites, v1)),
            }),
            inviteSearchBox = createElement(SearchBox, {
                zIndex = 3,
                placeholderText = "Enter a player name",
                position = UDim2.fromOffset(0, -32),
                size = UDim2.fromOffset(240, 24),
                onTextChanged = v2,
            }),
        }),
    })
end