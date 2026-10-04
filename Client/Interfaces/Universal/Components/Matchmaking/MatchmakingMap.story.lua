-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingMap.story
-- Decompile time: 2.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MatchmakingMap = require(script.Parent.MatchmakingMap)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Component() -- Line: 9 -- upvalues: createElement (val), MatchmakingMap (val)
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
            HorizontalFlex = Enum.UIFlexAlignment.None,
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        badlands = createElement(MatchmakingMap, {title = "Badlands II", icon = 18134568961, LayoutOrder = 1}),
        polluted = createElement(MatchmakingMap, {title = "Polluted Wastelands II", icon = 18134724761, LayoutOrder = 2}),
        pizza = createElement(MatchmakingMap, {title = "Pizza Party", icon = 18134711615, LayoutOrder = 3}),
        badlands2 = createElement(MatchmakingMap, {title = "Badlands II", icon = 18134568961, LayoutOrder = 4}),
        polluted3 = createElement(MatchmakingMap, {title = "Polluted Wastelands II", icon = 18134724761, LayoutOrder = 5}),
        pizza4 = createElement(MatchmakingMap, {
            title = "Pizza Party",
            icon = 18134711615,
            locked = true,
            lockedText = "LVL 25",
            LayoutOrder = 6,
        }),
        pizza5 = createElement(MatchmakingMap, {
            title = "Pizza Party",
            icon = 18134711615,
            locked = true,
            lockedText = "LVL 25",
            LayoutOrder = 7,
        }),
        pizza6 = createElement(MatchmakingMap, {
            title = "Pizza Party",
            icon = 18134711615,
            locked = true,
            lockedText = "LVL 25",
            LayoutOrder = 8,
        }),
    })
end

return function(a1) -- Line: 85 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 89 -- upvalues: u4 (val)
        u4:unmount()
    end
end