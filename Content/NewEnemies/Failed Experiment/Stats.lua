-- Script path: ReplicatedStorage.Content.NewEnemies.Failed Experiment.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    Health = 2500,
    Defense = 50,
    RewardThreshold = 0.33,
    Reward = 12000,
    HealthPerDifficulty = {Intermediate = 9000, PVP_midRanks = 4000, SummerMedium = 3000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}