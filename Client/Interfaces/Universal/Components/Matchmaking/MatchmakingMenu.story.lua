-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingMenu.story
-- Decompile time: 3.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameModeCard = require(script.Parent.GameModeCard)
local MatchmakingMenu = require(script.Parent.MatchmakingMenu)
local MatchmakingPlayerCount = require(script.Parent.MatchmakingPlayerCount)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement

local function DummyCountContent() -- Line: 14 -- upvalues: createElement (val), MatchmakingPlayerCount (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Wraps = true,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.Name,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        player1 = createElement(MatchmakingPlayerCount, {count = 1}),
        player2 = createElement(MatchmakingPlayerCount, {count = 2}),
        player3 = createElement(MatchmakingPlayerCount, {count = 3}),
    })
end

local function DummyGameModeContent() -- Line: 48 -- upvalues: createElement (val), GameModeCard (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.25, 0.6),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.55}),
        layout = createElement("UIPageLayout", {
            TweenTime = 0.1,
            EasingStyle = Enum.EasingStyle.Sine,
            Padding = UDim.new(0.1, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        card1 = createElement(GameModeCard, {title = "Survival", subTitle = "Classic TDS!"}, {}),
        card2 = createElement(GameModeCard, {
            title = "Hardcore",
            subTitle = "GET YOUR GAME ON!",
            character = 18850538394,
            background = 18768003444,
            popular = true,
        }, {}),
        card3 = createElement(GameModeCard, {
            title = "Baby Mode",
            subTitle = "WAAAAAAAAA!",
            background = 18768133436,
            character = 18703413345,
            disabled = true,
            subTitleColor = Color3.fromRGB(221, 98, 255),
        }, {}),
    })
end

local function Component() -- Line: 92
    -- upvalues: useScale (val), createElement (val), MatchmakingMenu (val), DummyGameModeContent (val)
    return createElement(MatchmakingMenu, {title = "Choose a Gamemode"}, {
        scale = createElement("UIScale", {Scale = 1 + (1 - useScale(1.7))}),
        content = createElement(DummyGameModeContent),
    })
end

return function(a1) -- Line: 106 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 110 -- upvalues: u4 (val)
        u4:unmount()
    end
end