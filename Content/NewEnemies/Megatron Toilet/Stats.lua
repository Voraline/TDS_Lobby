-- Script path: ReplicatedStorage.Content.NewEnemies.Megatron Toilet.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.25,
    MaxHealth = 8000,
    Reward = 2500,
    RewardThreshold = 0.25,
    Defense = 40,
    HealthPerDifficulty = {Easy = 2500, Intermediate = 3400, Insane = 3400},
    Attributes = {},
}