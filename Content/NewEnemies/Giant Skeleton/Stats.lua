-- Script path: ReplicatedStorage.Content.NewEnemies.Giant Skeleton.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    MaxHealth = 1800,
    Shield = 0,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {
        Act3 = 5000,
        Act3Easy = 2500,
        PollutedWasteland = 6000,
        Chapter1Mission6 = 2500,
        Chapter1Mission7 = 475,
    },
    ShieldPerDifficulty = {Act3 = 10000, Act3Easy = 5000},
    Reward = {
        Badlands = 4000,
        Act3 = 4000,
        Act3Easy = 4000,
        Chapter1Mission6 = 6000,
        Chapter1Mission7 = 600,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}