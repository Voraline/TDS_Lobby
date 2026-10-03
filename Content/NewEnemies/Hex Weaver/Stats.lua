-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Weaver.Stats
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local WeightTable = require(ReplicatedStorage.Shared.Modules.WeightTable)
local v1 = {
    {Chance = 50, Modifier = Enum.Modifier.Bloated},
    {Chance = 50, Modifier = Enum.Modifier.Nimble},
}
return {
    DisplayName = "Mutagenic Blight",
    Health = 10000,
    Speed = 2,
    Range = 24,
    Reward = 5500,
    Defense = 50,
    ExplosionRadius = 5,
    ProjectileVelocity = 40,
    AbilityCooldown = 7.5,
    HealthPerDifficulty = {Act3 = 2500, Act3Easy = 1250},
    ModifiersWeightTable = WeightTable.new(v1),
    ModifierWeights = v1,
    ModifiersGiven = {Enum.Modifier.StunImmune},
    EnemyIgnoreList = {"Titus", "Conserver", "Hex Weaver", "Reaver", "Hex's Maw", "Conjurer", "Reaper"},
}