-- Script path: ReplicatedStorage.Content.Shrines.Marathon
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    icon = 82074457034461,
    displayName = "Marathon",
    durationWaves = 4,
    description = ("Enemies gain a %*%% speed buff for %* waves."):format(50, 4),
    colors = {Color3.fromRGB(62, 202, 255), (Color3.fromRGB(80, 109, 255))},
    stats = {
        {label = "Duration", value = 4, suffix = " Waves"},
        {label = "Enemy Speed", value = 1.5, displayValue = ("+%*%%"):format(50)},
    },
    reward = {amount = 40, type = Enum.CurrencyType.Gems},
    effects = {enemyStatusEffects = {Enum.StatusEffect.Marathon}},
}