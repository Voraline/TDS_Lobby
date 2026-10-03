-- Script path: ReplicatedStorage.Content.NewEnemies.Hazem Boss.Stats
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.2,
    MaxHealth = 7500,
    RewardThreshold = 0.01,
    GlobalCooldown = 17,
    HealthPerDifficulty = {PlsDonate = 50000, PlsDonateHard = 225000},
    Reward = {PlsDonate = 100000, PlsDonateHard = 500000},
    AttackStats = {
        Eureka = {
            SpawnRange = 50,
            Height = 50,
            dtMultiplier = 4,
            Gravity = -5,
            Velocity = 1,
            Amount = 20,
            StunTime = 1.5,
            StunRadius = 12,
            UnitDamage = 100,
            Rate = 25,
            Range = 15,
        },
        HammerSlam = {Rate = 40, UnitDamage = 100, StunRadius = 100, StunTime = 3},
        CatSummon = {
            Rate = 40,
            Spawns = {
                Cat = {Amount = 10, Delay = 0.3, Modifiers = {[Enum.Modifier.Bloated] = true}},
            },
        },
    },
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}