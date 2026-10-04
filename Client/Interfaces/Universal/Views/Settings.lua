-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Settings
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local Settings = require(ReplicatedStorage.Client.Interfaces.Components.Settings)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 14
    -- upvalues: useViewEnabled (val), useCharmSelector (val), SettingsStore (val), createElement (val), Settings (val)
    local Settings_3, Settings_2 = useViewEnabled("Settings")
    return createElement(Settings, {
        Visible = Settings_3,
        Close = function() -- Line: 22 -- upvalues: Settings_2 (val)
            Settings_2("Hotbar")
        end,
        Settings = useCharmSelector(SettingsStore.getState, function(a1) -- Line: 16
            return a1.Game
        end),
        UpdateSetting = function(a1, a2) -- Line: 27 -- upvalues: SettingsStore (upval)
            SettingsStore.setGameSetting(a1, a2)
        end,
    })
end