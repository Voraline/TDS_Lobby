-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingPlayerCount.story
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MatchmakingPlayerCount = require(script.Parent.MatchmakingPlayerCount)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Component() -- Line: 9 -- upvalues: createElement (val), MatchmakingPlayerCount (val)
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

return function(a1) -- Line: 43 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 47 -- upvalues: u4 (val)
        u4:unmount()
    end
end