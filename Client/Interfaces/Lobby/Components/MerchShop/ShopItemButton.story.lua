-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopItemButton.story
-- Decompile time: 2.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShopItemButton = require(script.Parent.ShopItemButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), ShopItemButton (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), ShopItemButton (upval)
        local v1, u4 = React.useState(true)
        React.useEffect(function() -- Line: 13 -- upvalues: u4 (val)
            local u3 = task.delay(3, function() -- Line: 14 -- upvalues: u4 (upval)
                u4(false)
            end)
            return function() -- Line: 18 -- upvalues: u3 (val)
                task.cancel(u3)
            end
        end, {})
        return createElement(React.Fragment, {}, {
            btn1 = createElement(ShopItemButton, {
                aspectRatio = 2,
                banner = "LIMITED!",
                position = UDim2.fromScale(0.5, 0.4),
                size = UDim2.fromScale(0.2, 0.2),
                anchorPoint = Vector2.new(0.5, 0.5),
                loading = v1,
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
                position = UDim2.fromScale(0.5, 0.65),
                size = UDim2.fromScale(0.15, 0.2),
                anchorPoint = Vector2.new(0.5, 0.5),
                items = {{icon = 138200902492872, text = "Mini DJ\nBooth Plush"}},
            }),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 67 -- upvalues: u7 (val)
        u7:unmount()
    end
end