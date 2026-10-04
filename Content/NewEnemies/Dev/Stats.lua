-- Script path: ReplicatedStorage.Content.NewEnemies.Dev.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 200,
    Defense = 75,
    Reward = 2000,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {PlsDonate = 1000, PlsDonateHard = 2500},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}