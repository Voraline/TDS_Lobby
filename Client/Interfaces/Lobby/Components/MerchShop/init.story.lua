-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.init.story
-- Decompile time: 1.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), Parent (upval)
        return createElement(Parent, {
            visible = true,
            aspectRatio = 1.5,
            header = "MERCH SHOP",
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.fromScale(0.5, 0.5),
            size = UDim2.fromScale(0.8, 0.8),
            items = {},
            onClose = function() end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 26 -- upvalues: u7 (val)
        u7:unmount()
    end
end