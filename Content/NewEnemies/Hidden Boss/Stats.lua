-- Script path: ReplicatedStorage.Content.NewEnemies.Hidden Boss.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 450,
    HealthPerDifficulty = {
        Easy = 450,
        Casual = 1500,
        Intermediate = 850,
        Insane = 800,
        Molten = 1000,
        PVP_lowRanks = 750,
        PVP_midRanks = 850,
        PVP_highRanks = 800,
        NilZone = 3000,
        Chapter1Mission5 = 750,
        Chapter1Mission7 = 1750,
        Chapter1Mission8 = 2200,
    },
    Reward = {
        Easy = 600,
        Casual = 500,
        Intermediate = 850,
        Insane = 600,
        Molten = 1400,
        PVP_lowRanks = 600,
        PVP_midRanks = 600,
        PVP_highRanks = 600,
        NilZone = 2000,
        Chapter1Mission5 = 1000,
        Chapter1Mission7 = 600,
        Chapter1Mission8 = 1000,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}