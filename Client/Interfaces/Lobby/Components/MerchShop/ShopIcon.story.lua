-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopIcon.story
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ShopIcon = require(script.Parent.ShopIcon)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), ShopIcon (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), ShopIcon (upval)
        return createElement(ShopIcon, {
            banner = "FREE SKIN!",
            icon = 107057329781154,
            text = "Plush DJ Skin",
            position = UDim2.fromScale(0.5, 0.5),
            size = UDim2.fromScale(0.3, 0.3),
            anchorPoint = Vector2.new(0.5, 0.5),
        }, {
            sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 200)}),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 29 -- upvalues: u7 (val)
        u7:unmount()
    end
end