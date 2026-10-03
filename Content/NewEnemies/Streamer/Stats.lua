-- Script path: ReplicatedStorage.Content.NewEnemies.Streamer.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    MaxHealth = 36,
    Reward = 20,
    HealthPerDifficulty = {Easy = 36, Intermediate = 50, Insane = 60},
    Attributes = {},
}