-- Script path: ReplicatedStorage.Content.Shrines.Begger
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    icon = 105057631201818,
    displayName = "Beggar",
    durationWaves = 3,
    description = ("Upgrades cost +%*%% for %* waves."):format(20, 3),
    colors = {Color3.fromRGB(232, 126, 46), (Color3.fromRGB(255, 204, 92))},
    stats = {
        {label = "Duration", value = 3, suffix = " Waves"},
        {label = "Upgrade Cost", value = 1.2, displayValue = ("+%*%%"):format(20)},
    },
    reward = {amount = 50, type = Enum.CurrencyType.Gems},
    effects = {upgradeCostMultiplier = 1.2},
}