-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.CrosshairView
-- Decompile time: 1.06 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Crosshair = require(ReplicatedStorage.Client.Interfaces.Game.Components.Crosshair)
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement

local function render(a1) -- Line: 13
    -- upvalues: useCharmSelector (val), CrosshairStore (val), createElement (val), Crosshair (val)
    if not useCharmSelector(CrosshairStore.getState, function(a1) -- Line: 14
        return a1.enabled
    end) then
        return
    end
    return createElement(Crosshair, {spread = a1.spread})
end

return function() -- Line: 27
    -- upvalues: Players (val), Create (val), useCharmBinding (val), CrosshairStore (val), ReactRoblox (val)
    -- upvalues: createElement (val), render (val), LocalPlayer (val)
    if not Players.LocalPlayer.PlayerGui:FindFirstChild("Crosshair") then
        Create("ScreenGui", {
            Name = "ReactGameCrosshair",
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 999999998,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Parent = Players.LocalPlayer.PlayerGui,
        })
    end
    return ReactRoblox.createPortal({
        Frame = createElement(render, {
            spread = useCharmBinding(CrosshairStore.getState, function(a1) -- Line: 39
                return a1.spread
            end),
        }),
    }, LocalPlayer.PlayerGui.ReactGameCrosshair)
end