-- Script path: ReplicatedStorage.Content.NewEnemies.Nerd Duck.Stats
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Nerd Ducky",
    Description = "The latest invention by Nerd Duck: a state-of-the-art machine wing-crafted by the mechanist nerd who equipped it with the latest engineering of duck weaponry. With the discovery of the God Shard, its energy output allowed Nerd Duck to harness its power and advance currently known duck technology. This masterpiece stands as Nerd Duck’s prized creation.",
    Health = 1000000,
    Speed = 0.75,
    Defense = 15,
    RewardThreshold = 0.125,
    RageModeDebounce = 15,
    HealthPerDifficulty = {Hard = 1000000, Easy = 400000},
    Reward = {Hard = 1250000, Easy = 500000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    Moveset = {
        NerdRage = {
            Cooldown = 52.5,
            AttackCooldown = 6,
            Range = 0,
            RadiusRange = 50,
            StunDuration = 6,
            UnitDamage = 1500,
        },
        DuckyDecoy = {
            Cooldown = 25,
            AttackCooldown = 6,
            Range = 0,
            RadiusRange = 50,
            RandomOffset = NumberRange.new(-0, -0),
            Spawns = {["Mega Duck"] = {amount = 1, Defense = 0, modifiers = {}, stats = {Health = 10000}}},
        },
        DuckyStampede = {
            Cooldown = 42.5,
            AttackCooldown = 8,
            Range = 0,
            RadiusRange = 50,
            Spawns = {
                ["Elite Ducky"] = {amount = 10},
                ["Mega Duck"] = {amount = 1, Defense = 100, modifiers = {}, stats = {}},
            },
        },
        DuckyDischarge = {
            Cooldown = 12.5,
            AttackCooldown = 10,
            Range = 0,
            RadiusRange = 50,
            ExplosionRadius = 50,
            StunTime = 5,
            BaseDamage = 30,
            StunDuration = 8,
            UnitDamage = 100000,
        },
        DuckyReposition = {Cooldown = 32.5, AttackCooldown = 6, Range = 0, RadiusRange = 25},
        DuckyBlast = {
            Cooldown = 15,
            AttackCooldown = 3,
            Range = 0,
            RadiusRange = 50,
            ExplosionRadius = 6,
            ProjectileTime = 0.85,
            Fatige = 30,
            FatigueTime = 8,
            RangeReduce = 0,
            RangeReudceTime = 0,
        },
    },
}