-- Script path: ReplicatedStorage.Content.Enemies.Breaker3.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 100,
    Defense = 20,
    HealthPerDifficulty = {Normal = 80, Insane = 100, Easy = 50},
    Attributes = {},
}