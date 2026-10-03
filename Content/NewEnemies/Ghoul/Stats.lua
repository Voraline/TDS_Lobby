-- Script path: ReplicatedStorage.Content.NewEnemies.Ghoul.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.25,
    Health = 500,
    Defense = 30,
    HealthPerDifficulty = {PollutedWasteland = 800, SummerMedium = 250},
    Reward = {PollutedWasteland = 1000, Intermediate = 650, SummerMedium = 175},
}