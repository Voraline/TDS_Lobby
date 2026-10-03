-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.TowerAmmoPreview
-- Decompile time: 1.19 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactRoblox)
local GatlingGunAmmo = require(ReplicatedStorage.Client.Interfaces.Game.Components.GatlingGunAmmo)
local TowerAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerAmmoStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement

local function render() -- Line: 15
    -- upvalues: useCharmSelector (val), TowerAmmoStore (val), useCharmBinding (val), createElement (val)
    -- upvalues: GatlingGunAmmo (val)
    local v1 = useCharmSelector(TowerAmmoStore.getState, function(a1) -- Line: 16
        return a1.enabled
    end)
    local v2 = useCharmBinding(TowerAmmoStore.getState)
    return createElement(GatlingGunAmmo, {
        MaxAmmo = v2:map(function(a1) -- Line: 22
            return a1.maxAmmo
        end),
        Ammo = v2:map(function(a1) -- Line: 26
            return a1.ammo
        end),
        Reloading = v2:map(function(a1) -- Line: 30
            return a1.reloading
        end),
        Position = UDim2.new(0.5, 0, 0.5, 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(200, 16),
        Visible = v1,
    })
end

return function(a1) -- Line: 45 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(1)
    a1.setIgnoreGuiInset(true)
    return createElement(render)
end