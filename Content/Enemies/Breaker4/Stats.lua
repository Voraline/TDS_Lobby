-- Script path: ReplicatedStorage.Content.Enemies.Breaker4.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Price = 100,
    Speed = 3,
    MaxHealth = 200,
    Defense = 35,
    HealthPerDifficulty = {Normal = 140, Insane = 200, Easy = 80},
    Attributes = {},
}