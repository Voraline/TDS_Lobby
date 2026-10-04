-- Script path: ReplicatedStorage.Content.NewEnemies.Withered.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 750,
    Defense = 50,
    Speed = 7.5,
    MaxHealth = 5000,
    Reward = 750,
    RewardThreshold = 0.25,
    HealthPerDifficulty = {Act3 = 6000, Act3Easy = 3000, Badlands = 450},
    Attributes = {},
}