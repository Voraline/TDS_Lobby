-- Script path: ReplicatedStorage.Client.Interfaces.Components.Currency.story
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Currency = require(script.Parent.Currency)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), Currency (val), ReactRoblox (val)
    local v1 = createElement(Currency, {
        type = "Coins",
        value = 10000000000000,
        anchorPoint = Vector2.new(0.5, 0.5),
        position = UDim2.fromScale(0.5, 0.5),
        clicked = function() -- Line: 15
            print("Currency clicked!")
        end,
    })
    local u17 = ReactRoblox.createRoot(a1)
    u17:render(v1)
    return function() -- Line: 23 -- upvalues: u17 (val)
        u17:unmount()
    end
end