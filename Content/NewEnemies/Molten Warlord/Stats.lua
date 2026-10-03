-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Warlord.Stats
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 150000,
    Speed = 1.3,
    Reward = 250000,
    RewardThreshold = 0.01,
    Phase2Threshold = 0.35,
    HealthPerDifficulty = {SummerHard = 100000},
    Summons = {
        Spawns = {
            {Name = "Molten Mech", Chance = 15, Delay = 0.25},
            {Name = "Molten Golem", Chance = 35, Delay = 0.25},
            {Name = "Elite Boomer", Chance = 20, Delay = 0.25},
            {Name = "Molten Necromancer", Chance = 30, Delay = 0.25},
        },
    },
    Attacks = {
        Fireball = {
            PhaseAllowed = 1,
            Fatigue = 60,
            UnitDamage = 225,
            Duration = 10,
            Range = 50,
            Radius = 12,
            Cooldown = 28,
            AttackCooldown = 7.5,
        },
        EruptionSlam = {
            PhaseAllowed = 1,
            Range = 35,
            StunTime = 5.5,
            UnitDamage = 225,
            Cooldown = 35,
            AttackCooldown = 5.5,
        },
        HammerSlam = {
            PhaseAllowed = 1,
            Range = 14,
            Radius = 7,
            StunTime = 4.5,
            UnitDamage = 1000,
            Cooldown = 24,
            AttackCooldown = 4.5,
        },
        WarCry = {
            PhaseAllowed = 1,
            SummonAmount = 8,
            Cooldown = 600,
            AttackCooldown = 3,
            HealRate = 1000000,
        },
        MoltenRain = {
            PhaseAllowed = 2,
            Range = 50,
            ProjectileCount = 25,
            Height = 50,
            Radius = 5,
            StunTime = 5,
            UnitDamage = 225,
            SpawnTime = 1,
            Cooldown = 45,
            AttackCooldown = 3,
        },
    },
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.FireImmune},
}