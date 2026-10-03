-- Script path: ReplicatedStorage.Content.NewEnemies.Rift Walker.Stats
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Rift Walker is an being who helped create the Meta with his master. Together, they maintain the balance of the realms, and will destroy any who threaten it. The Rift Walker is powerful enough to rival greatest enemies from the Old World, and his judgment is absolute. He is known to be strict, for if he fails, everyone from all realities will end up in the Nil Zone.",
    Health = 1000000,
    Speed = 1.1,
    Phase2Threshold = 0.6,
    RewardThreshold = 0.01,
    RageModeDebounce = 15,
    HealthPerDifficulty = {Act3 = 2500000, Act3Easy = 200000},
    Reward = {Act3 = 1750000, Act3Easy = 1250000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    Moveset = {
        LordExoAttack = {Cooldown = 60, Range = 600, BaseDamage = 50},
        DimensionalDischarge = {
            phase2Only = true,
            Cooldown = 90,
            DebuffDuration = 10,
            Range = 100,
            RandomDebuffs = {Range = 20, Damage = 20, Cooldown = 20},
        },
        NullBeam = {Cooldown = 25, StunTime = 3, UnitDamage = 2000, Range = 30},
        NullBubbles = {
            Cooldown = 30,
            Range = 60,
            RangeDebuff = 25,
            TowersToPick = 3,
            DistanceApart = 10,
        },
        DimensionalShift = {
            Cooldown = 50,
            Range = 60,
            RangeDebuff = 30,
            TowersToPick = 4,
            DistanceApart = 10,
        },
        NullInvasion = {
            Cooldown = 50,
            StunTime = 3,
            UnitDamage = 800,
            Range = 15,
            EnemiesPerLane = 6,
            RandomPortalOffset = NumberRange.new(-20, 0),
            Enemies = {"Corrupted Engineer", "Corrupted Warden", "Corrupted Brawler"},
            RandomModifierList = {},
        },
    },
}