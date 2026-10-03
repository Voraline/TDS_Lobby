-- Script path: ReplicatedStorage.Content.NewEnemies.Bolt.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 9,
    MaxHealth = 65,
    HealthPerDifficulty = {
        Baby = 60,
        Easy = 65,
        Normal = 65,
        Casual = 200,
        Intermediate = 125,
        Insane = 65,
        PVP = 65,
        PVP_lowRanks = 65,
        PVP_midRanks = 65,
        PVP_highRanks = 65,
        PlsDonateHard = 65,
        Badlands = 65,
        PollutedWasteland = 65,
        Trial = 400,
        Chapter1Mission8 = 600,
    },
    Reward = {
        Easy = 40,
        Normal = 40,
        Casual = 100,
        Intermediate = 35,
        Insane = 40,
        PVP = 40,
        PlsDonateHard = 40,
        Badlands = 40,
        PollutedWasteland = 40,
        Trial = 200,
        Chapter1Mission8 = 225,
        Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    },
}