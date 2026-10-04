-- Script path: ReplicatedStorage.Content.Enemies.Breaker2.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5,
    MaxHealth = 50,
    HealthPerDifficulty = {Normal = 30, Insane = 50, Easy = 15},
    Attributes = {},
}