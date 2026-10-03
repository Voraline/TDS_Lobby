-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Scout.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Scout",
    Description = "Scout stared down the Null Scout, and the creature stared back. Scout lifted one arm, and so it mirrored. He lifted the other — Null Scout followed. Scout quickly dropped both arms and aimed his weapons at the creature, who copied it. Then from the side, Trapper threw a landmine behind the Null Scout. Scout grinned, and stepped back — … and Null Scout followed.",
    Speed = 4,
    Scale = 1.3,
    Defense = 30,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {
        Act1Easy = 175,
        Act2Easy = 350,
        Act3Easy = 30,
        Act1 = 225,
        Act2 = 700,
        Act3 = 80,
    },
    ShieldPerDifficulty = {
        Act2Easy = 50,
        Act3Easy = 10,
        Act1 = 75,
        Act2 = 100,
        Act3 = 20,
    },
    Reward = {
        Act1Easy = 400,
        Act2Easy = 400,
        Act3Easy = 80,
        Act1 = 400,
        Act2 = 1200,
        Act3 = 80,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}