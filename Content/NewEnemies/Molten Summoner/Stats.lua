-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Summoner.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 16500,
    Reward = 20000,
    RewardThreshold = 0.25,
    Speed = 2.25,
    MinSpawn = 3,
    MaxSpawn = 3,
    Cooldown = 12,
    HealthPerDifficulty = {SummerMedium = 10000, Molten = 15000},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.FireImmune},
    EnemySpawns = {{Chance = 100, Value = "Elite Molten"}},
    Weights = {{Chance = 100, Value = Enum.Modifier.MoltenCorpse}},
}