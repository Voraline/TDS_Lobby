-- Script path: ReplicatedStorage.Content.NewEnemies.Toilet.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    MaxHealth = 16,
    Reward = 15,
    HealthPerDifficulty = {Easy = 16, Intermediate = 24, Insane = 32},
    Attributes = {},
}