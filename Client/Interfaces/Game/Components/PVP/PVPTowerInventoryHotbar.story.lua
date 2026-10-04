-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHotbar.story
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPTowerInventoryHotbar = require(script.Parent.PVPTowerInventoryHotbar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPTowerInventoryHotbar (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), PVPTowerInventoryHotbar (upval)
        return createElement(PVPTowerInventoryHotbar, {
            Size = UDim2.fromOffset(320, 108),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            items = {"Scout", "Soldier", "Engineer", "Pyromancer"},
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 28 -- upvalues: u7 (val)
        u7:unmount()
    end
end