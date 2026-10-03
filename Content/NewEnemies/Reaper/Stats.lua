-- Script path: ReplicatedStorage.Content.NewEnemies.Reaper.Stats
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    MaxHealth = 35000,
    Reward = 40000,
    Defense = 0,
    RewardThreshold = 0.1,
    HealthPerDifficulty = {Act3 = 20000, Act3Easy = 12000},
    Summon = {Count = 3, Spawns = {{Name = "Demon", Chance = 100}}},
    Attributes = {Enum.Modifier.FireImmune, Enum.Modifier.StunImmune},
}