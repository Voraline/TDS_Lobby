-- Script path: ReplicatedStorage.Content.NewEnemies.Tank.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    MaxHealth = 6000,
    HealthPerDifficulty = {
        Insane = 6000,
        Badlands = 12000,
        PVP_lowRanks = 4000,
        PVP_midRanks = 4000,
        PVP_highRanks = 5000,
        Trial = 6000,
    },
    Attributes = {},
    Reward = {Insane = 3000, PVP = 3000, Badlands = 12000},
}