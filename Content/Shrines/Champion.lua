-- Script path: ReplicatedStorage.Content.Shrines.Champion
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    icon = 110000819256277,
    displayName = "Champion",
    durationWaves = 3,
    description = ("Enemies spawn with %*%% more health for %* waves."):format(40, 3),
    colors = {Color3.fromRGB(255, 72, 72), (Color3.fromRGB(255, 166, 74))},
    stats = {
        {label = "Duration", value = 3, suffix = " Waves"},
        {displayValue = "Bloated", label = "Enemy Modifier", value = "Bloated"},
        {label = "Enemy Health", value = 1.4, displayValue = ("+%*%%"):format(40)},
    },
    reward = {amount = 60, type = Enum.CurrencyType.Gems},
    effects = {
        enemyStatusEffects = {{Modifier = Enum.Modifier.Bloated, Parameters = {HealthMultiplier = 1.4}}},
    },
}