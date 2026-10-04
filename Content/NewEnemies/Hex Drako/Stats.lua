-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Drako.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 1000,
    Defense = 100,
    Reward = 500,
    HealthPerDifficulty = {Act3 = 1000, Act3Easy = 500},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}