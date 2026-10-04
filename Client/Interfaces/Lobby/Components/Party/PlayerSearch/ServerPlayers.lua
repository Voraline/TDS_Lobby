-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerSearch.ServerPlayers
-- Decompile time: 12.33 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SearchResult = require(Party.PlayerSearch.SearchResult)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useState = React.useState
local useContext = React.useContext
local useEffect = React.useEffect
local memo = React.memo
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation

local function createPlayers(a1, a2, a3) -- Line: 42
    -- upvalues: createElement (val), SearchResult (val)
    local v1 = {}
    local v2 = nil
    local v3 = nil
    local v4, v5, v6 = a3, a1, a2
    for i, j in a2, v2, v3 do
        if j ~= v4 then
            if v5 == "" or string.match(j.DisplayName:lower(), v5:lower()) then
                table.insert(v1, (createElement(SearchResult, {layoutOrder = 0, player = j, players = v6})))
            end
        end
    end
    return v1
end

local function createFriends(a1, a2, a3) -- Line: 67
    -- upvalues: Players (val), createElement (val), SearchResult (val)
    local v1 = {}
    local v2 = nil
    local v3 = nil
    local v4, v5, v6 = a1, a2, a3
    for i, j in a2, v2, v3 do
        if v4 == "" then
            if not Players:GetPlayerByUserId(j.VisitorId) then
                table.insert(v1, (createElement(SearchResult, {layoutOrder = 2, friend = j, friends = v5, host = v6})))
            end
        elseif string.match(j.DisplayName:lower(), v4:lower()) and not Players:GetPlayerByUserId(j.VisitorId) then
            table.insert(v1, (createElement(SearchResult, {layoutOrder = 2, friend = j, friends = v5, host = v6})))
        end
    end
    return v1
end

local u60 = memo(function(a1) -- Line: 93
    -- upvalues: useGroupAnimation (val), useAnimation (val), Tween (val), createElement (val), ImageLabel (val)
    -- upvalues: TextLabel (val)
    local v1, v2 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.15), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.3), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.3)})
    v2(if not a1.visible then "disable" else "enable")
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.94, 0.825),
        Position = v1.position,
        AnchorPoint = Vector2.new(0.5, 0),
    }, {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        frame = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }, {
            image = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = "rbxassetid://104789469370491",
                ZIndex = 1,
                LayoutOrder = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ImageTransparency = v1.transparency,
                ScaleType = Enum.ScaleType.Fit,
            }),
        }, {padding = createElement("UIPadding", {PaddingBottom = UDim.new(0.1, 0)})}),
        title = createElement(TextLabel, {
            FontWeight = "ExtraBold",
            Text = "Uh oh...",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        subTitle = createElement(TextLabel, {
            FontWeight = "Medium",
            Text = "what happened to all the players?",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
    })
end)
return function(a1) -- Line: 181
    -- upvalues: useContext (val), PartyContext (val), useState (val), useEffect (val), createElement (val), u60 (val)
    -- upvalues: TextLabel (val), React (val), createPlayers (val), createFriends (val)
    local u3 = useContext(PartyContext)
    local searchText = a1.searchText
    local v1, u8 = useState(u3.host)
    local v2 = useEffect
    local v3 = {u3.host}
    v2(function() -- Line: 187 -- upvalues: u8 (val), u3 (val)
        u8(u3.host)
    end, v3)
    v3 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -192, 0.5, 0),
        Size = UDim2.fromOffset(384, 384),
    }
    local v4 = {}
    local v5 = {}
    local v6 = false
    if #a1.players == 0 then
        v6 = #u3.friends == 0
    end
    v5.visible = v6
    v4.emptyList = createElement(u60, v5)
    v5 = {
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
        Size = UDim2.fromScale(1, 1),
        CanvasSize = UDim2.fromScale(0, 0),
    }
    v6 = {}
    v6.listLayout = createElement("UIListLayout", {
        Wraps = true,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v6.padding = createElement("UIPadding", {
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
    })
    v6.serverTextLabel = if not (#a1.players > 1) or not (#u3.friends > 0) then nil else createElement(TextLabel, {
        FontWeight = "Bold",
        FontStyle = "Italic",
        LayoutOrder = -1,
        Text = "In Server",
        TextScaled = true,
        StrokeThickness = 2,
        Size = UDim2.new(1, 0, 0, 28),
        StrokeColor = Color3.fromRGB(0, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
    })
    v6.friendsTextLabel = if not (#u3.friends > 0) then nil else createElement(TextLabel, {
        FontWeight = "Bold",
        FontStyle = "Italic",
        LayoutOrder = 1,
        Text = "Your Friends",
        TextScaled = true,
        StrokeThickness = 2,
        Size = UDim2.new(1, 0, 0, 28),
        StrokeColor = Color3.fromRGB(0, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
    })
    v6.searchResults = if not (#a1.players > 1) then nil else createElement(React.Fragment, nil, (createPlayers(searchText, a1.players, v1)))
    v6.friendSearchResults = if not (#u3.friends > 0) then nil else createElement(React.Fragment, nil, (createFriends(searchText, u3.friends, v1)))
    v4.scrollList = createElement("ScrollingFrame", v5, v6)
    return createElement("Frame", v3, v4)
end