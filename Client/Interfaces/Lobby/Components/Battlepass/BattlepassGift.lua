-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassGift
-- Decompile time: 16.48 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.Data.Seasons)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local BattlepassButton = require(script.Parent.BattlepassButton)
local IconButton = require(Components.IconButton)
local ImageLabel = require(Components.ImageLabel)
local useEvent = require(Hooks.useEvent)
require(Hooks.useTransparencyModifier)
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local memo = React.memo
local Event = React.Event
local Fragment = React.Fragment
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local useCallback = React.useCallback
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local createElement = React.createElement

local function sortPlayers(a1) -- Line: 43 -- upvalues: table (val) -- types: a1: table
    table.sort(a1, function(a1, a2) -- Line: 44
        return a1.Name < a2.Name
    end)
end

local function usePlayers() -- Line: 49 -- upvalues: useState (val), Players (val), table (val), useEvent (val)
    local v1, u3 = useState(function() -- Line: 50 -- upvalues: Players (upval), table (upval)
        local v1 = {}
        for i, j in Players:GetPlayers() do
            if j ~= Players.LocalPlayer then
                table.insert(v1, j)
            end
        end
        table.sort(v1, function(a1, a2) -- Line: 44
            return a1.Name < a2.Name
        end)
        return v1
    end)
    useEvent(Players.PlayerAdded, function(a1) -- Line: 63 -- upvalues: Players (upval), u3 (val), table (upval)
        if a1 == Players.LocalPlayer then
            return
        end
        u3(function(a1_2) -- Line: 68 -- upvalues: table (upval), a1 (val)
            local v1 = table.clone(a1_2)
            if not table.find(v1, a1) then
                table.insert(v1, a1)
            end
            return v1
        end)
    end, {})
    useEvent(Players.PlayerRemoving, function(a1) -- Line: 79 -- upvalues: Players (upval), u3 (val), table (upval)
        if a1 == Players.LocalPlayer then
            return
        end
        u3(function(a1_2) -- Line: 84 -- upvalues: table (upval), a1 (val)
            local v1 = table.clone(a1_2)
            local v2 = table.find(v1, a1)
            if not v2 then
                return a1_2
            end
            table.remove(v1, v2)
            table.sort(v1, function(a1, a2) -- Line: 44
                return a1.Name < a2.Name
            end)
            return v1
        end)
    end, {})
    return v1
end

local u70 = memo(function(a1) -- Line: 104
    -- upvalues: useGroupAnimation (val), useAnimation (val), Tween (val), createElement (val), ImageLabel (val)
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
    v2(if not a1.Visible then "disable" else "enable")
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
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Uh oh...",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        subTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "what happened to all the players?",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
    })
end)
local u73 = memo(function(a1) -- Line: 208 -- upvalues: createElement (val), BattlepassButton (val)
    local LayoutOrder = a1.LayoutOrder
    local onGift = a1.onGift
    local player = a1.player
    local v1 = {
        BorderSizePixel = 0,
        BackgroundTransparency = a1.Transparency,
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 0.127),
        LayoutOrder = LayoutOrder,
    }
    local v2 = {uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(0.108, 0)})}
    v2.giftButton = createElement(BattlepassButton, {
        icon = 78029059209884,
        background = 136115219080104,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.983, 0.5),
        Size = UDim2.fromScale(0.088, 0.65),
        transparency = a1.Transparency,
        clicked = function() -- Line: 232 -- upvalues: onGift (val), player (val)
            if onGift then
                onGift(player)
            end
        end,
    })
    v2.playerName = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.449, 0.535),
        Size = UDim2.fromScale(0.622, 0.459),
        Text = ("@%*"):format(player.Name),
        TextTransparency = a1.Transparency,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v3.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(player and player.UserId or 0)
    v3.ImageTransparency = a1.Transparency
    v3.Position = UDim2.fromScale(0.0589, 0.5)
    v3.Size = UDim2.fromScale(0.0842, 0.676)
    v2.playerHeadshot = createElement("ImageLabel", v3, {uICorner2 = createElement("UICorner", {CornerRadius = UDim.new(0, 2)})})
    return createElement("Frame", v1, v2)
end)
local u76 = memo(function(a1) -- Line: 279 -- upvalues: createElement (val), Fragment (val), table (val), u73 (val)
    local players = a1.players or {}
    local Transparency = a1.Transparency
    local onGift = a1.onGift
    return createElement("ScrollingFrame", {
        Active = true,
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        CanvasSize = UDim2.new(),
        Position = UDim2.fromScale(0.5, 0.15),
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0.94, 0.825),
    }, {
        uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}),
        players = createElement(Fragment, nil, table.reduce(players, function(a1, a2, a3) -- Line: 306 -- upvalues: createElement (upval), u73 (upval), Transparency (val), onGift (val)
            local v1 = tostring(a2.UserId)
            a1[v1] = (createElement(u73, {LayoutOrder = a3, Transparency = Transparency, onGift = onGift, player = a2}))
            return a1
        end, {})),
    })
end)
return memo(function(a1) -- Line: 320
    -- upvalues: usePlayers (val), useGroupAnimation (val), useAnimation (val), Tween (val), useEffect (val)
    -- upvalues: createElement (val), IconButton (val), u76 (val), u70 (val)
    local players = a1.players or usePlayers()
    local u7 = a1.Visible ~= false
    local v1, u54 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.6), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.6)})
    local v2 = {u7}
    useEffect(function() -- Line: 338 -- upvalues: u54 (val), u7 (val)
        u54(if not u7 then "disable" else "enable")
    end, v2)
    v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1.position,
    }
    local Size = a1.Size or UDim2.fromScale(0.414, 0.765)
    v2.Size = Size
    v2.Visible = v1.transparency:map(function(a1) -- Line: 350
        return a1 < 0.99
    end)
    return createElement("Frame", v2, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.9}),
        closeButton = createElement(IconButton, {
            AnchorPoint = Vector2.new(1, 0),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Position = UDim2.fromScale(0.962, 0.0346),
            Size = UDim2.fromScale(0.0728, 0.065),
            Color = Color3.fromRGB(255, 60, 60),
            Transparency = v1.transparency,
            Clicked = a1.closed,
        }),
        players = createElement(u76, {players = players, onGift = a1.onGift, Transparency = v1.transparency}),
        emptyPlayer = createElement(u70, {Visible = not next(players) and u7}),
        bG = createElement("ImageLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://139735184273975",
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v1.transparency,
            Position = UDim2.fromScale(0.5, 0.511),
            Size = UDim2.fromScale(1.31, 1.28),
        }),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://118883411077405",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v1.transparency,
            Position = UDim2.fromScale(0.0411, 0.0339),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.0696, 0.0678),
        }),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Players",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.145, 0.035),
            Size = UDim2.fromScale(0.685, 0.0763),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    })
end)