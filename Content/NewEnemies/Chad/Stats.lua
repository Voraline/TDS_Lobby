-- Script path: ReplicatedStorage.Content.NewEnemies.Chad.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 80,
    Reward = 30,
    Defense = 40,
    HealthPerDifficulty = {Easy = 80, Intermediate = 100, Insane = 120},
    Attributes = {},
}