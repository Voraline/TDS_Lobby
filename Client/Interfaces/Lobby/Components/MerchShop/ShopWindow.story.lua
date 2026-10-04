-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopWindow.story
-- Decompile time: 1.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local ShopItemButton = require(script.Parent.ShopItemButton)
local ShopWindow = require(script.Parent.ShopWindow)
local createElement = React.createElement
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useScale (val), ShopWindow (val), ShopItemButton (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13 -- upvalues: useScale (upval), createElement (upval), ShopWindow (upval), ShopItemButton (upval)
        local v1 = 200 * useScale(1)
        return createElement(ShopWindow, {
            icon = 138497422942213,
            header = "MERCH SHOP",
            aspectRatio = 1.5,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.fromScale(0.5, 0.5),
            size = UDim2.fromScale(0.8, 0.8),
        }, {
            btn1 = createElement(ShopItemButton, {
                banner = "LIMITED!",
                size = UDim2.fromOffset(v1, v1),
                anchorPoint = Vector2.new(0.5, 0.5),
                items = {
                    {
                        icon = 138200902492872,
                        text = "Mini DJ Booth Plush",
                        iconSize = UDim2.fromScale(1, 1),
                        iconScaleType = Enum.ScaleType.Crop,
                    },
                    {icon = 107057329781154, text = "Plush DJ Skin", banner = "FREE SKIN!"},
                },
            }),
            btn2 = createElement(ShopItemButton, {
                aspectRatio = 1,
                banner = "LIMITED!",
                anchorPoint = Vector2.new(0.5, 0.5),
                size = UDim2.fromOffset(v1, v1),
                items = {{icon = 138200902492872, text = "Mini DJ\nBooth Plush"}},
            }),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 64 -- upvalues: u7 (val)
        u7:unmount()
    end
end