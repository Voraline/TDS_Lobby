-- Script path: ReplicatedStorage.Content.NewEnemies.PngBot.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5.35,
    MaxHealth = 50,
    Reward = 15,
    HealthPerDifficulty = {Easy = 50, Intermediate = 70, Insane = 100},
    Attributes = {},
}