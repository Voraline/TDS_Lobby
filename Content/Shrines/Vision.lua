-- Script path: ReplicatedStorage.Content.Shrines.Vision
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    icon = 108646135840550,
    displayName = "Vision",
    durationWaves = 3,
    description = ("Towers have %*%% less range for %* waves."):format(30, 3),
    colors = {Color3.fromRGB(161, 92, 255), (Color3.fromRGB(81, 184, 255))},
    stats = {
        {label = "Duration", value = 3, suffix = " Waves"},
        {label = "Tower Range", value = 0.7, displayValue = ("-%*%%"):format(30)},
    },
    reward = {amount = 50, type = Enum.CurrencyType.Gems},
    effects = {towerRangeMultiplier = 0.7},
}