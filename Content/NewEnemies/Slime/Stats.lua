-- Script path: ReplicatedStorage.Content.NewEnemies.Slime.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    Health = 350,
    Reward = 250,
    HealthPerDifficulty = {SummerMedium = 600},
    Attributes = {},
    ControllerStats = {transformRate = 10000},
}