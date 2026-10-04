-- Script path: ReplicatedStorage.Content.NewEnemies.Giant Boss.Stats
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 150,
    Speed = 2,
    MaxHealth = 2000,
    Defense = 20,
    RewardThreshold = 0.25,
    HealthPerDifficulty = {
        Badlands = 9000,
        Intermediate = 12500,
        Trial = 9000,
        Chapter1Mission1 = 300,
        Chapter1Mission4 = 4500,
        Chapter1Mission5 = 750,
        Chapter1Mission7 = 10000,
    },
    Reward = {
        Badlands = 15000,
        Intermediate = 24000,
        Trial = 3000,
        Chapter1Mission1 = 5000,
        Chapter1Mission4 = 3000,
        Chapter1Mission5 = 10000,
        Chapter1Mission7 = 15000,
    },
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}