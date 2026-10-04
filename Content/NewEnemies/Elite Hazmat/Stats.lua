-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Hazmat.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 250,
    Defense = 60,
    HealthPerDifficulty = {Trial = 400, Intermediate = 320, Molten = 320},
    Reward = {Molten = 450, SummerHard = 200, Trial = 150, Intermediate = 450},
    Attributes = {
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.StunImmune,
    },
}