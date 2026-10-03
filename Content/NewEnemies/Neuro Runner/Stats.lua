-- Script path: ReplicatedStorage.Content.NewEnemies.Neuro Runner.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    MaxHealth = 250,
    Reward = 250,
    Defense = 50,
    HealthPerDifficulty = {Act1Easy = 125, Act1 = 250},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}