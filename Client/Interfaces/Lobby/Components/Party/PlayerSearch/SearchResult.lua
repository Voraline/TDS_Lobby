-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerSearch.SearchResult
-- Decompile time: 4.84 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local usePlayerValue = require(Hooks.usePlayerValue)
local useSpring = ReactFlow.useSpring
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
return function(a1) -- Line: 41
    -- upvalues: React (val), PartyContext (val), usePlayerValue (val), useBinding (val), useSpring (val)
    -- upvalues: useEffect (val), LocalPlayer (val), createElement (val), ImageLabel (val), TextLabel (val)
    -- upvalues: Button (val)
    local u4 = React.useContext(PartyContext)
    local player = a1.player
    if not player then
        player = a1.friend
    end
    local v1 = if not a1.player then useBinding(0) else usePlayerValue("Level", player, 1, true)
    local players_2 = a1.players or {}
    local friends = u4.friends or {}
    local host = players_2[1]
    if not host then
        host = a1.host
    end
    local invited = u4 and u4.invited
    local partyParams = u4.partyParams
    if partyParams then
        partyParams = u4.partyParams.membersCanInvite
    end
    local u55 = invited
    if u55 then
        u55 = table.find(invited, player) ~= nil
    end
    local players = u4.players
    if players then
        players = table.find(u4.players, player) ~= nil
    end
    local v2, u69 = useBinding(true)
    local u73, u74 = useBinding(tick())
    local v3, u87 = useBinding(if not a1.friend then "" else "Online")
    local v4, u91 = useSpring({start = 1, speed = 30, damper = 0.7})
    local v5 = {partyParams, players_2, host, friends}
    useEffect(function() -- Line: 64 -- upvalues: host (val), LocalPlayer (upval), partyParams (val), u69 (val)
        if host == LocalPlayer or partyParams then
            u69(true)
            return
        end
        u69(false)
    end, v5)
    local v6 = useEffect
    v5 = {players, u55, u4.friend}
    v6(function() -- Line: 76 -- upvalues: players (val), u87 (val), u55 (val), a1 (val)
        if players then
            u87("In Party")
            return
        end
        if u55 then
            u87("Invited")
            return
        end
        u87(if not a1.friend then "" else "Online")
    end, v5)
    return createElement("Frame", {
        Active = true,
        BackgroundTransparency = 1,
        Size = UDim2.new(0.3, 0, 0, 90),
        LayoutOrder = a1.layoutOrder,
    }, {
        bin = createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {
            scale = createElement("UIScale", {Scale = v4}),
            corner = createElement("UICorner"),
            stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}),
            playerIcon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(player.UserId or player.VisitorId),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromScale(0.9, 0.9),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
            }, {
                gradient = createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.05, 1),
                        NumberSequenceKeypoint.new(0.125, 0),
                        NumberSequenceKeypoint.new(0.817, 0),
                        NumberSequenceKeypoint.new(0.95, 1),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
            playerName = createElement(TextLabel, {
                ZIndex = 5,
                FontWeight = "Black",
                TextScaled = true,
                TextWrapped = true,
                AutoLocalize = false,
                StrokeThickness = 2,
                AnchorPoint = Vector2.new(0.5, 0),
                Text = ("%*"):format(player.DisplayName),
                TextXAlignment = Enum.TextXAlignment.Center,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(1, 0.3),
                StrokeColor = Color3.fromRGB(0, 0, 0),
                StrokeLineJoinMode = Enum.LineJoinMode.Round,
            }, {
                padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
                textConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18}),
            }),
            statusFrame = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Size = UDim2.fromScale(0.9, 0.15),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
            }, {
                listLayout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                padding = createElement("UIPadding", {PaddingLeft = UDim.new(0.1, 0)}),
                statusDot = createElement("Frame", {
                    BorderSizePixel = 2,
                    LayoutOrder = 1,
                    Visible = v3:map(function(a1) -- Line: 174
                        return a1 == "Online"
                    end),
                    BackgroundColor3 = Color3.fromRGB(91, 226, 91),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(0.5, 0.5),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                }, {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
                status = createElement(TextLabel, {
                    LayoutOrder = 2,
                    ZIndex = 5,
                    FontWeight = "Bold",
                    TextScaled = true,
                    TextWrapped = true,
                    StrokeThickness = 2,
                    Text = React.joinBindings({v3, v1}):map(function(a1) -- Line: 192
                        if a1[1] ~= "" then
                            return a1[1]
                        end
                        return (("Lvl. %*"):format(a1[2]))
                    end),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    StrokeColor = Color3.fromRGB(0, 0, 0),
                    StrokeLineJoinMode = Enum.LineJoinMode.Round,
                }),
            }),
            invite = createElement(Button, {
                BackgroundIcon = "",
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(1, 1),
                Visible = v2:map(function(a1) -- Line: 216 -- upvalues: players (val), u55 (val)
                    return a1 and not players and not u55
                end),
                OnHover = function() -- Line: 220 -- upvalues: u91 (val)
                    u91({target = 1.1})
                end,
                OnUnhover = function() -- Line: 223 -- upvalues: u91 (val)
                    u91({target = 1})
                end,
                Clicked = function() -- Line: 227 -- upvalues: u73 (val), u74 (val), u91 (val), u4 (val), player (val)
                    if tick() - u73:getValue() < 0.2 then
                        return
                    end
                    u74(tick())
                    u91({target = 1.1})
                    u4.invitePlayer(player)
                end,
                OnHold = function() -- Line: 238 -- upvalues: u91 (val)
                    u91({target = 0.9})
                end,
            }),
        }),
    })
end