-- Script path: ReplicatedStorage.Content.NewEnemies.Forsaken Skull.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5,
    MaxHealth = 300,
    Reward = 300,
    Defense = 50,
    HealthPerDifficulty = {Act2Easy = 150, Act2 = 300, Act3Easy = 150, Act3 = 300},
    Attributes = {
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.Flying,
    },
}