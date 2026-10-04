-- Script path: ReplicatedStorage.Content.NewEnemies.Eggroll 3.Stats
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Eggroll",
    Speed = 3.25,
    Health = 35,
    HealthPerDifficulty = {Hard = 15, Easy = 7},
    Reward = {Hard = 30, Easy = 30},
    Summon = {Spawns = {{Name = "Ducky", Chance = 100}}, Modifiers = {{Chance = 100}}},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}