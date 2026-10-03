-- Script path: ReplicatedStorage.Content.NewEnemies.Eggroll 1.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Eggroll",
    Speed = 3.25,
    Health = 35,
    HealthPerDifficulty = {Hard = 20, Easy = 10},
    Reward = {Hard = 80, Easy = 80},
    Summon = {
        Spawns = {{Name = "Ducky", Chance = 100}},
        Modifiers = {{Chance = 100, Modifier = Enum.Modifier.Nimble}},
    },
    Attributes = {Enum.Modifier.HealthRegen},
}