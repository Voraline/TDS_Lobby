-- Script path: ReplicatedStorage.Content.NewEnemies.Producer.Stats
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    MaxHealth = 250000,
    RewardThreshold = 0.05,
    Speed = 1.05,
    Scale = 1.3,
    Description = "The Producer initially began as a personified manifestation of the Narrator's imagination — a vision of his ideal partner that existed only in his mind after finding a projector in the trash. During the Final Act, however, this imaginary partner was recreated in reality. Though, we wonder if Narrator would be different if he only knew.",
    HealthPerDifficulty = {Hard = 275000, Easy = 75000},
    Reward = {Hard = 250000, Easy = 150000},
    Abilities = {
        Beam = {
            Phase = 1,
            Range = 20,
            FOV = 120,
            UnitDamage = 1600,
            StunTime = 4,
            Cooldown = 20,
            AttackCooldown = 5,
            Windup = 1.5,
            Endlag = 2,
        },
        Clapboard = {
            Phase = 1,
            StunTime = 3.5,
            UnitDamage = 700,
            Cooldown = 36,
            AttackCooldown = 5,
            Windup = 3,
            Endlag = 2,
        },
        Spotlight = {
            Phase = 1,
            Cooldown = 45,
            AttackCooldown = 1,
            FatigueDebuff = 75,
            Range = 100,
            Radius = 14,
            Windup = 3,
            Endlag = 1.25,
        },
        Summon = {
            Phase = 1,
            Count = 6,
            Cooldown = 35,
            AttackCooldown = 1.5,
            SummonTime = 3,
            Spawns = {
                {Name = "Actor1", Chance = 75, Delay = 0.75},
                {Name = "Actor2", Chance = 15, Delay = 1.5},
                {Name = "Actor3", Chance = 10, Delay = 1.5},
            },
            Modifiers = {
                {Chance = 60},
                {Chance = 20, Value = Enum.Modifier.Bloated},
                {Chance = 20, Value = Enum.Modifier.HealthRegen},
            },
        },
    },
    Attributes = {Enum.Modifier.Boss},
}