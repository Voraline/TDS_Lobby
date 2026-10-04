-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Warden.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Null Warden",
    Description = "As the Null Warden crawled from the rift, the original tightened his gear and flicked out his baton. Warden glared at it from behind his visor. \"Man you are ugly.\" he muttered. The Null Warden ran forward, slowed by the gear it wore. Warden planted his feet and raised his shield. \"I don't know if I should feel insulted.\"",
    Speed = 3.3,
    Health = 4000,
    Defense = 0,
    Scale = 1.5,
    RewardThreshold = 0.25,
    HealthPerDifficulty = {
        Act1Easy = 3000,
        Act2Easy = 3000,
        Act3Easy = 1500,
        Act1 = 5000,
        Act2 = 6000,
        Act3 = 3000,
    },
    ShieldPerDifficulty = {
        Act2Easy = 1500,
        Act3Easy = 1000,
        Act1 = 3000,
        Act2 = 4000,
        Act3 = 2000,
    },
    Reward = {
        Act1Easy = 6000,
        Act2Easy = 6000,
        Act3Easy = 5000,
        Act1 = 8000,
        Act2 = 10000,
        Act3 = 5000,
    },
    Attributes = {},
}