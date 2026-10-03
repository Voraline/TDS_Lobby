-- Script path: ReplicatedStorage.Content.NewEnemies.Hallow Guard.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3.7,
    MaxHealth = 1000,
    Shield = 7000,
    Defense = 30,
    HealthPerDifficulty = {Act3 = 1000, Act3Easy = 500},
    ShieldPerDifficulty = {Act3 = 7000, Act3Easy = 3500},
    Reward = {Act3 = 2000, Act3Easy = 2000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}