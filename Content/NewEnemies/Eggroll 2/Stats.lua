-- Script path: ReplicatedStorage.Content.NewEnemies.Eggroll 2.Stats
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Eggroll",
    Speed = 3.25,
    Health = 35,
    HealthPerDifficulty = {Hard = 17, Easy = 9},
    Reward = {Hard = 35, Easy = 35},
    Summon = {
        Spawns = {{Name = "Ducky", Chance = 100}},
        Modifiers = {{Chance = 100, Modifier = Enum.Modifier.Bloated}},
    },
    Attributes = {Enum.Modifier.HealthRegen},
}