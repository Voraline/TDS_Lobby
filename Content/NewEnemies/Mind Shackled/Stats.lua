-- Script path: ReplicatedStorage.Content.NewEnemies.Mind Shackled.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 1500,
    Reward = 3000,
    RewardThreshold = 0.1,
    Defense = 30,
    HealthPerDifficulty = {Act1Easy = 900, Act1 = 1500},
    Attributes = {},
}