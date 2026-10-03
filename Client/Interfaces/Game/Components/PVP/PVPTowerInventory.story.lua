-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventory.story
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHeader)
local PVPTowerInventory = require(script.Parent.PVPTowerInventory)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useBinding = React.useBinding
local u32 = {11643, 16983447, 49601674, 19004289}
return function(a1) -- Line: 22 -- upvalues: createElement (val), PVPTowerInventory (val), u32 (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 23 -- upvalues: createElement (upval), PVPTowerInventory (upval), u32 (upval)
        return createElement(PVPTowerInventory, {
            Size = UDim2.fromScale(0.5, 0.7),
            Position = UDim2.fromScale(0.5, 0.55),
            AnchorPoint = Vector2.new(0.5, 0.5),
            equippedConsumables = {},
            equippedTowers = {"Scout", "Minigunner", "Commander", "Pyromancer"},
            towerInventory = {
                Scout = {Skin = "Fallen"},
                Sniper = {Skin = "Default"},
                Minigunner = {Skin = "Golden"},
                Commander = {Skin = "Plushie"},
                Pyromancer = {Skin = "Golden"},
            },
            bansPerPlayer = {[u32[1]] = 2, [u32[2]] = 2, [u32[3]] = 2, [u32[4]] = 2},
            redPlayers = {u32[1], u32[2]},
            bluePlayers = {u32[3], u32[4]},
            towerClicked = function(a1) end,
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 110 -- upvalues: u7 (val)
        u7:unmount()
    end
end