-- Script path: ReplicatedStorage.Content.NewEnemies.Executioner Skeleton.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 5000,
    Shield = 25000,
    Speed = 3.65,
    Defense = 50,
    Cooldown = 8,
    Range = 15,
    UnitDamage = 1000,
    RangeDebuffTime = 4,
    RangeDebuff = -25,
    HealthPerDifficulty = {Act3 = 5000, Act3Easy = 5000},
    ShieldPerDifficulty = {Act3 = 20000, Act3Easy = 5000},
    Reward = {Act3 = 8000, Act3Easy = 8000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}