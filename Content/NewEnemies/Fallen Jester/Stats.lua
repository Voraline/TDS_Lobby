-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Jester.Stats
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local WeightTable = require(ReplicatedStorage.Shared.Modules.WeightTable)
local v1 = {
    {Chance = 50, Modifier = Enum.Modifier.Bloated},
    {Chance = 50, Modifier = Enum.Modifier.Blessed},
}
return {
    Health = 5000,
    Speed = 3,
    Range = 24,
    ExplosionRadius = 5,
    ProjectileVelocity = 40,
    AbilityCooldown = 7.5,
    Description = "Fallen Jesters entertained the royal court, their performances bringing joy even as hope vanished along with the magic. They put on spectacular shows and gave gifts unlike anything anyone had seen, yet they could never change the despair seen in the faces of their audience. The day the Queen died, as did their laughter. The curse turned their gifts into tainted presents that strengthen their army. Their performances continue, but no one is there to watch.",
    HealthPerDifficulty = {Fallen = 10000, SummerExperimental = 2500},
    Reward = {Fallen = 100, SummerExperimental = 2500},
    ModifiersWeightTable = WeightTable.new(v1),
    ModifierWeights = v1,
    ModifiersGiven = {Enum.Modifier.StunImmune},
    EnemyIgnoreList = {"Fallen King", "Awakened Fallen King", "Templar", "Fallen Seraph", "Fallen Angel"},
}