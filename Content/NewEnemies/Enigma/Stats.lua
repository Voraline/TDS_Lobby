-- Script path: ReplicatedStorage.Content.NewEnemies.Enigma.Stats
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 10,
    MaxHealth = 100,
    Defense = 0,
    Reward = 2000,
    HealthPerDifficulty = {Act3Easy = 250, Act3 = 500, NilZone = 2000, NilZone2 = 2000},
    Attributes = {Enum.Modifier.FreezeImmune},
    Summon = {
        Amount = 1,
        Spawns = {
            {Name = "Actor1", Chance = 50, Delay = 0.1},
            {Name = "Actor2", Chance = 25, Delay = 0.1},
            {Name = "Actor3", Chance = 25, Delay = 0.1},
        },
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