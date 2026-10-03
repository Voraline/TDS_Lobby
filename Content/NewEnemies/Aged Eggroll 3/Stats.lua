-- Script path: ReplicatedStorage.Content.NewEnemies.Aged Eggroll 3.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Aged Eggroll",
    Speed = 3.75,
    Health = 110,
    HealthPerDifficulty = {Hard = 110, Easy = 55},
    Reward = {Hard = 150, Easy = 150},
    Summon = {Spawns = {{Name = "Fat Ducky", Chance = 100}}, Modifiers = {{Chance = 100}}},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}