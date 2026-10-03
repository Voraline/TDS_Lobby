-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.GiftboxPanel.story
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GiftboxPanel = require(script.Parent.GiftboxPanel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u21 = {
    {cover = 9361085943, sender = "Duck Hunting", reward = "Ducky Commander", rewardIcon = 9378098303},
    {cover = 9361085943, sender = "Daily Gift", reward = "500 Coins", rewardIcon = 6031068426},
    {cover = 9361085943, reward = "Champion Tag", rewardIcon = 6031082533},
}

local function App() -- Line: 29 -- upvalues: createElement (val), GiftboxPanel (val), u21 (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(28, 31, 35),
        Size = UDim2.fromScale(1, 1),
    }, {
        open = createElement(GiftboxPanel, {
            items = u21,
            position = UDim2.fromOffset(360, 40),
            anchorPoint = Vector2.new(0, 0),
        }),
        empty = createElement(GiftboxPanel, {
            items = {},
            position = UDim2.fromOffset(720, 40),
            anchorPoint = Vector2.new(0, 0),
        }),
        closed = createElement(GiftboxPanel, {
            visible = false,
            items = u21,
            position = UDim2.fromOffset(1080, 40),
            anchorPoint = Vector2.new(0, 0),
        }),
    })
end

return function(a1) -- Line: 56 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 60 -- upvalues: u4 (val)
        u4:unmount()
    end
end