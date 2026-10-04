-- Script path: ReplicatedStorage.Content.NewEnemies.PngBot3.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 260,
    Reward = 150,
    Defense = 20,
    HealthPerDifficulty = {Easy = 260, Insane = 500, Intermediate = 400},
    Attributes = {},
}