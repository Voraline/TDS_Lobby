-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.FakeWaveText.story
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FakeWaveText = require(ReplicatedStorage.Client.Interfaces.Game.Components.FakeWaveText)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), FakeWaveText (val), ReactRoblox (val)
    local v1 = createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.2),
        Size = UDim2.fromOffset(386, 32),
        AnchorPoint = Vector2.new(0.5, 0),
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Text = createElement(FakeWaveText, {text = "Wave ???", scale = 2}),
    })
    local u32 = ReactRoblox.createRoot(a1)
    u32:render(v1)
    return function() -- Line: 29 -- upvalues: u32 (val)
        u32:unmount()
    end
end