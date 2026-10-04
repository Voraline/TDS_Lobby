-- Script path: ReplicatedStorage.Content.NewEnemies.Lost Glitch.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Lost Glitch is an enraged enemy that embodies the Nil Zone's instability. It relentlessly hunts Null Runners, who have learned to run at the sight of it. The creature's very existence appears to cause it pain, as it evolved from the same thing that it hunts.",
    Speed = 6,
    HealthPerDifficulty = {
        Act1Easy = 150,
        Act2Easy = 175,
        Act3Easy = 40,
        Act1 = 250,
        Act2 = 300,
        Act3 = 80,
    },
    Reward = {
        Act1Easy = 300,
        Act2Easy = 400,
        Act3Easy = 75,
        Act1 = 300,
        Act2 = 400,
        Act3 = 75,
    },
    Attributes = {},
}