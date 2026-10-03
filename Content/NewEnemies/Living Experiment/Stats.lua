-- Script path: ReplicatedStorage.Content.NewEnemies.Living Experiment.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    MaxHealth = 1800,
    RewardThreshold = 0.25,
    Defense = 30,
    HealthPerDifficulty = {Intermediate = 2400, PVP_midRanks = 3000, SummerMedium = 3250, Trial = 3000},
    Reward = {Intermediate = 3400, PVP_midRanks = 2500, SummerMedium = 3000, Trial = 1200},
    Attributes = {},
    ControllerStats = {healRadius = 7, healRate = 0.35},
}