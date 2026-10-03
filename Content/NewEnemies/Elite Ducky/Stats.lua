-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Ducky.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Elite Ducky has achieved the highest merits one could receive in training and serves as a shining example for other ducklings. Military Ducky especially looks up to Elite Ducky for his resolve and determination in the army. Such loyalty is admirable, so much so that even Mega Ducky has taken notice.",
    Speed = 4,
    MaxHealth = 400,
    Defense = 0,
    HealthPerDifficulty = {Hard = 250, Easy = 125},
    Reward = {Hard = 375, Easy = 375},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}