-- Script path: ReplicatedStorage.Content.NewEnemies.Alien.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4.5,
    MaxHealth = 60,
    Reward = 1750,
    RewardThreshold = 0.5,
    Defense = 30,
    HealthPerDifficulty = {PlsDonate = 1000, PlsDonateHard = 1750},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}