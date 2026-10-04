-- Script path: ReplicatedStorage.Content.NewEnemies.Nightmarish Hulk.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5.5,
    MaxHealth = 3000,
    RewardThreshold = 0.25,
    Reward = 4000,
    Defense = 50,
    HealthPerDifficulty = {Act2Easy = 2000, Act2 = 3000, Act3Easy = 2000, Act3 = 3000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}