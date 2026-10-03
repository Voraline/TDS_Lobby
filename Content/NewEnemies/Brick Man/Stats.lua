-- Script path: ReplicatedStorage.Content.NewEnemies.Brick Man.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4.35,
    MaxHealth = 100,
    Reward = 60,
    HealthPerDifficulty = {Easy = 120, Intermediate = 140, Insane = 200},
    Attributes = {},
}