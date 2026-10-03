-- Script path: ReplicatedStorage.Content.NewEnemies.Null Runner.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Null Runners are quick enemies that can scale most surfaces with their strong grip and claws. They hunt methodically, stalking their prey and wearing them down to exhaustion. These creatures often tease the weaker Nullings, at least until a Null Dredge shows up.",
    Speed = 6.5,
    Health = 12,
    HealthPerDifficulty = {
        Act1Easy = 8,
        Act2Easy = 10,
        Act3Easy = 20,
        Act1 = 12,
        Act2 = 25,
        Act3 = 45,
    },
    Reward = {
        Act1Easy = 12,
        Act2Easy = 12,
        Act3Easy = 40,
        Act1 = 12,
        Act2 = 30,
        Act3 = 40,
    },
    Attributes = {},
}