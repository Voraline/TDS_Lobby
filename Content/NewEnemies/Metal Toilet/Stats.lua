-- Script path: ReplicatedStorage.Content.NewEnemies.Metal Toilet.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    MaxHealth = 600,
    Reward = 600,
    Defense = 35,
    HealthPerDifficulty = {Easy = 600, Intermediate = 700, Insane = 900},
    Attributes = {},
}