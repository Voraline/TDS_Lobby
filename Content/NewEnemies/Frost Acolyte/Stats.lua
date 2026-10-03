-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Acolyte.Stats
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Blizzard Wizard",
    MaxHealth = 3000,
    Speed = 3.3,
    Scale = 1.25,
    Threshold = 0.5,
    rewardThreshold = 0.33,
    HealthPerDifficulty = {Frost = 3000},
    Reward = {Frost = 2250},
    Attacks = {
        Summon = {
            Amount = 2,
            Delay = 1,
            Cooldown = 15,
            Spawns = {{Name = "Snow Minion", Weight = 100}},
            Modifiers = {{Chance = 100}},
        },
    },
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}