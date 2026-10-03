-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Mimic.Stats
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    MaxHealth = 100,
    PanicPerc = 30,
    PanicAggroModifierPerc = 50,
    PanicSpawnRateMult = 2,
    Shield = 50,
    Reward = 100,
    HealthPerDifficulty = {Act2Easy = 100, Act2 = 250, Act3Easy = 200, Act3 = 400},
    Attributes = {Enum.Modifier.StunImmune},
    Summon = {
        Spawns = {{Name = "Hex Minion", Chance = 50, Delay = 2}, {Name = "Hex Wraith", Chance = 25, Delay = 2}},
        Modifiers = {
            {Chance = 20},
            {Chance = 30, Modifier = Enum.Modifier.Nimble},
            {Chance = 10, Modifier = Enum.Modifier.Bloated},
            {Chance = 20, Modifier = Enum.Modifier.HealthRegen},
            {Chance = 10, Modifier = Enum.Modifier.Aggro},
            {Chance = 20, Modifier = Enum.Modifier.Hidden},
        },
    },
}