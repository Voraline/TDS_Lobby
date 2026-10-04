-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop
-- Decompile time: 3.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ShopItemButton = require(script.ShopItemButton)
local ShopWindow = require(script.ShopWindow)
local useScale = require(Hooks.useScale)
local memo = React.memo
local createElement = React.createElement
return (memo(function(a1) -- Line: 22 -- upvalues: useScale (val), createElement (val), ShopItemButton (val), ShopWindow (val)
    local v1
    local v2 = 200 * useScale(1, nil, false)
    local items = a1.items or {}
    local v3 = {}
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in items, v4, v5 do
        if j.loading or next(j.items) ~= nil then
            v1 = ("item%*"):format(i)
            v3[v1] = (createElement(ShopItemButton, {
                size = UDim2.fromOffset(v2, v2),
                anchorPoint = Vector2.new(0.5, 0.5),
                layoutOrder = i,
                color = j.color,
                banner = j.banner,
                items = j.items,
                loading = j.loading,
                onClick = j.clicked,
            }))
        end
    end
    return createElement(ShopWindow, {
        aspectRatio = 1.5,
        icon = 138497422942213,
        header = "MERCH SHOP",
        visible = v6.visible,
        onClose = v6.onClose,
        loading = v6.loading,
        anchorPoint = Vector2.new(0.5, 0.5),
        position = UDim2.fromScale(0.5, 0.5),
        size = UDim2.fromScale(0.8, 0.8),
    }, v3)
end))