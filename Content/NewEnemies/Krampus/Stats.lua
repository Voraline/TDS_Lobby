-- Script path: ReplicatedStorage.Content.NewEnemies.Krampus.Stats
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.5,
    MaxHealth = 150000,
    Reward = 75000,
    RewardThreshold = 0.01,
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
    ControllerStats = {
        SlamUnitDamage = 500,
        StunSlowdownTimeModifier = 0.5,
        AttackRange = 40,
        AttackRate = 15,
        EnemySpawnRange = 10,
        EnemySpawnRate = 2,
        SnowstormIcicleRange = 20,
        SnowstormIcicleRate = 0.1,
        SnowstormIcicleStunRadius = 7,
        SnowstormIcicleStunUnitDamage = 100,
        SnowstormIcicleAccuracy = 5,
        SlamStunTime = NumberRange.new(6, 10),
        EnemySpawnAmount = NumberRange.new(4, 7),
        SnowstormIcicleAmount = NumberRange.new(25, 30),
        SnowstormIcicleStunTime = NumberRange.new(5, 7),
        JumpPathsWhitelist = {2, 3},
    },
}