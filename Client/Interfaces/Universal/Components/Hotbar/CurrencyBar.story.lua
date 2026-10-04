-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.CurrencyBar.story
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrencyBar = require(script.Parent.CurrencyBar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 15 -- upvalues: ReactRoblox (val), createElement (val), CurrencyBar (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.1),
        Size = UDim2.fromOffset(100, 40),
    }, {
        bar = createElement(CurrencyBar, {
            items = {
                {
                    key = "gems",
                    amount = "1,250",
                    baseValue = 1250,
                    icon = "rbxassetid://80540700708777",
                    layoutOrder = 1,
                    visible = true,
                },
                {
                    key = "coins",
                    amount = "42,000",
                    baseValue = 42000,
                    icon = "rbxassetid://131637335676840",
                    layoutOrder = 2,
                    visible = true,
                },
                {
                    key = "spin",
                    amount = "3",
                    baseValue = 3,
                    hideBuyButton = true,
                    icon = "rbxassetid://18493073533",
                    layoutOrder = 6,
                    visible = true,
                },
            },
        }),
    })))
    return function() -- Line: 55 -- upvalues: u4 (val)
        u4:unmount()
    end
end