-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Necromancer.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 900,
    Speed = 3.5,
    SummonSpeed = 2.5,
    RewardThreshold = 0.5,
    MinSpawn = 2,
    MaxSpawn = 2,
    EnemySpawns = "Molten Demon",
    Cooldown = 12.5,
    HealthPerDifficulty = {SummerHard = 1500, Molten = 1750},
    Reward = {Molten = 1250, SummerHard = 1000},
    Weights = {
        {Chance = 30, Value = Enum.Modifier.Hidden},
        {Chance = 30, Value = Enum.Modifier.Nimble},
        {Chance = 40},
    },
    Attributes = {},
}