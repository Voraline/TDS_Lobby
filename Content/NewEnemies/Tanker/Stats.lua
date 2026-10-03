-- Script path: ReplicatedStorage.Content.NewEnemies.Tanker.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 10000,
    Speed = 3.5,
    GasLifetime = 15,
    ExplosionRadius = 12,
    HealPerTick = 1,
    HealTickRate = 0.5,
    Fatigue = 70,
    RangeReduction = 20,
    DebuffDuration = 10,
    RewardThreshold = 0.5,
    Scale = 1.3,
    HealthPerDifficulty = {Badlands = 5000, SummerHard = 7500, Molten = 17500},
    Thresholds = {0.6666666666666666, 0.3333333333333333},
    Reward = {Badlands = 5000, SummerHard = 7500, Trial = 7500, Molten = 17500},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}