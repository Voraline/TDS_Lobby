-- Script path: ReplicatedStorage.Content.Shrines.Decay
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    icon = 139579807635635,
    displayName = "Decay",
    durationWaves = 5,
    description = ("Base loses %*%% max HP every %* seconds for %* waves."):format(5, 5, 5),
    colors = {Color3.fromRGB(84, 220, 107), (Color3.fromRGB(45, 115, 78))},
    stats = {
        {label = "Duration", value = 5, suffix = " Waves"},
        {label = "Base HP", value = 0.05, displayValue = ("-%*%%"):format(5)},
        {label = "Interval", value = 5, displayValue = ("%*s"):format(5)},
    },
    reward = {amount = 40, type = Enum.CurrencyType.Gems},
    effects = {healthDrain = {percentMaxHealth = 0.05, interval = 5}},
}