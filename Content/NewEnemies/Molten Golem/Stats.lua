-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Golem.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 2750,
    Speed = 2,
    Defense = 30,
    Scale = 1.2,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {SummerHard = 3000},
    Reward = {Molten = 4000, SummerHard = 2000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}