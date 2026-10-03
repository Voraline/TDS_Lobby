-- Script path: ReplicatedStorage.Content.NewEnemies.Ducky D00M 3.Stats
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Ducky D00M is the creation of Nerd Duck that is geared towards getting revenge on the TDS team for deactivating their portal and causing their realm to suffer. With the help of the other ducklings and rough schematics, he managed to put together a weapon worthy of destroying his enemies.",
    Health = 50000,
    Speed = 1,
    Defense = 30,
    HealthPerDifficulty = {Hard = 200000, Easy = 100000},
    Reward = {Hard = 150000, Easy = 150000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    Moveset = {
        RocketBarrage = {
            Cooldown = 30,
            Range = 30,
            MinRange = 15,
            Radius = 10,
            ExplosionRadius = 3,
            Count = 10,
            TimeBetweenFire = 0.25,
            ProjSpeed = 25,
            StunLength = 5,
            FatiguePerc = 30,
            FatigueLen = 10,
            UnitDamage = 500,
            Windup = 0.8,
            Rest = 1,
        },
        ChainsawSlash = {
            Cooldown = 20,
            Range = 10,
            Radius = 12,
            AttackTime = 3,
            UpdateRate = 0.2,
            FOV = 120,
            StunLength = 6,
            UnitDamage = 5000,
            Windup = 1,
            Rest = 1.5,
        },
        MinigunSpray = {
            Range = 20,
            Cooldown = 40,
            AttackTime = 4,
            GrowTime = 0.5,
            RateOfFire = 0.05,
            HitboxSize = Vector3.new(8, 8, 20),
            StunLength = 8,
            UnitDamage = 50,
            Windup = 1,
            Rest = 1.5,
        },
    },
}