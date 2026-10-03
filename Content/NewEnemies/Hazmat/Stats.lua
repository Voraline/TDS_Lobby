-- Script path: ReplicatedStorage.Content.NewEnemies.Hazmat.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4.5,
    MaxHealth = 150,
    Defense = 60,
    HealthPerDifficulty = {
        Intermediate = 200,
        Casual = 175,
        Molten = 200,
        Fallen = 150,
        PVP_lowRanks = 150,
        SummerMedium = 300,
        Chapter1Mission4 = 180,
        Chapter1Mission7 = 200,
        Chapter1Mission8 = 400,
        Trial = 600,
    },
    Reward = {
        Easy = 350,
        Casual = 200,
        Intermediate = 350,
        PizzaParty = 350,
        Badlands = 350,
        Molten = 350,
        PVP_lowRanks = 350,
        SummerMedium = 350,
        Chapter1Mission4 = 180,
        Chapter1Mission7 = 200,
        Chapter1Mission8 = 200,
        Trial = 350,
    },
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}