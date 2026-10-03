-- Script path: ReplicatedStorage.Content.NewEnemies.Rotting Terror.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    RewardThreshold = 0.2,
    MaxHealth = 2000,
    Defense = 50,
    Reward = 3000,
    HealthPerDifficulty = {Act2Easy = 1000, Act2 = 2000, Act3Easy = 1500, Act3 = 3000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}