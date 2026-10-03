-- Script path: ReplicatedStorage.Content.NewEnemies.Trickster Elf.Stats
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local WeightTable = require(ReplicatedStorage.Shared.Modules.WeightTable)
local v1 = {{Chance = 100, Modifier = Enum.Modifier.Aggro}}
return {
    Scale = 1.65,
    DisplayName = "Jack Frost",
    Health = 45000,
    Speed = 3.25,
    Range = 50,
    Reward = 27000,
    RewardThreshold = 0.1,
    ExplosionRadius = 5,
    ProjectileVelocity = 40,
    AbilityCooldown = 9,
    RevealTime = 4,
    HealthPerDifficulty = {Fallen = 1000, SummerExperimental = 2500, Frost = 45000},
    ModifiersWeightTable = WeightTable.new(v1),
    ModifierWeights = v1,
    ModifiersGiven = {Enum.Modifier.StunImmune},
    Attributes = {Enum.Modifier.Hidden},
    EnemyIgnoreList = {"Frost Ravager", "Frost Hunter", "Mega Frost Mystery"},
}