-- Script path: ReplicatedStorage.Content.NewEnemies.Null Beast.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Null Beasts are the most common creatures prowling the Nil Zone, often moving in packs. These creatures travel the endless terrain, and if you're nearby, even in the silence, you're never truly alone.",
    Speed = 8.5,
    MaxHealth = 1200,
    Defense = 0,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {
        Act2Easy = 3000,
        Act3Easy = 5000,
        Act1 = 2000,
        Act2 = 10000,
        Act3 = 10000,
        NilZone = 6000,
    },
    Reward = {
        Act1Easy = 1200,
        Act2Easy = 5000,
        Act3Easy = 10000,
        Act1 = 3000,
        Act2 = 10000,
        Act3 = 15000,
    },
    Attributes = {},
}