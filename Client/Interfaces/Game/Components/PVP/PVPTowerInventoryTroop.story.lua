-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryTroop.story
-- Decompile time: 1.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local PVPTowerInventoryTroop = require(script.Parent.PVPTowerInventoryTroop)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 11 -- upvalues: createElement (val), PVPTowerInventoryTroop (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: createElement (upval), PVPTowerInventoryTroop (upval)
        return createElement(PVPTowerInventoryTroop, {
            name = "War Machine",
            icon = 6883317252,
            banning = true,
            Size = UDim2.fromOffset(118, 118),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            clicked = function() end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 67 -- upvalues: u7 (val)
        u7:unmount()
    end
end