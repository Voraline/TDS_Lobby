-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUserSetting
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local useCharmSelector = require(script.Parent.useCharmSelector)
return function(a1, a2) -- Line: 6 -- upvalues: useCharmSelector (val), SettingsStore (val) -- types: a1: string
    return useCharmSelector(SettingsStore.getState, function(a1_2) -- Line: 7 -- upvalues: a1 (val), a2 (val)
        local Game = a1_2.Game
        return Game and Game[a1] or a2
    end, {a1, a2})
end