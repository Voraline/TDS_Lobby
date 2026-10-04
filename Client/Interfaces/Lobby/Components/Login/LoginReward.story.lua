-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Login.LoginReward.story
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local LoginReward = require(script.Parent.LoginReward)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), LoginReward (val), ReactRoblox (val)
    local v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        coins = createElement(LoginReward, {
            title = "50 Coins",
            day = 1,
            icon = 3720654515,
            claimed = true,
            Position = UDim2.fromOffset(20, 20),
            AnchorPoint = Vector2.new(0, 0),
        }),
        gems = createElement(LoginReward, {
            title = "100 Gems",
            amount = 1,
            day = 2,
            icon = 3720654515,
            Position = UDim2.fromOffset(20, 20),
            AnchorPoint = Vector2.new(0, 0),
        }),
    })
    local u49 = ReactRoblox.createRoot(a1)
    u49:render(v1)
    return function() -- Line: 43 -- upvalues: u49 (val)
        u49:unmount()
    end
end