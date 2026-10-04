-- Script path: ReplicatedStorage.Content.NewEnemies.PngBot2.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4.5,
    MaxHealth = 120,
    Reward = 50,
    HealthPerDifficulty = {Easy = 120, Intermediate = 120, Insane = 200},
    Attributes = {},
}