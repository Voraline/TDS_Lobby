-- Script path: ReplicatedStorage.Content.NewEnemies.Reaver.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    Health = 200,
    Defense = 125,
    HealthPerDifficulty = {PollutedWasteland = 1500, SummerMedium = 400},
    Reward = {PollutedWasteland = 2000, Intermediate = 200, SummerMedium = 350},
    Attributes = {},
}