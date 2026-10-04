-- Script path: ReplicatedStorage.Content.NewEnemies.Aged Eggroll 2.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Aged Eggroll",
    Speed = 3.25,
    Health = 130,
    HealthPerDifficulty = {Hard = 130, Easy = 65},
    Reward = {Hard = 150, Easy = 150},
    Summon = {
        Spawns = {{Name = "Fat Ducky", Chance = 100}},
        Modifiers = {{Chance = 100, Modifier = Enum.Modifier.Bloated}},
    },
    Attributes = {Enum.Modifier.HealthRegen},
}