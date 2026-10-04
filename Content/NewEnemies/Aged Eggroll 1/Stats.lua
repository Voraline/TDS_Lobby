-- Script path: ReplicatedStorage.Content.NewEnemies.Aged Eggroll 1.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Aged Eggroll",
    Speed = 2.75,
    Health = 125,
    HealthPerDifficulty = {Hard = 150, Easy = 75},
    Reward = {Hard = 150, Easy = 150},
    Summon = {
        Spawns = {{Name = "Fat Ducky", Chance = 100}},
        Modifiers = {{Chance = 100, Modifier = Enum.Modifier.Nimble}},
    },
    Attributes = {Enum.Modifier.HealthRegen},
}