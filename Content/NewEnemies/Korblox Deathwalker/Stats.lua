-- Script path: ReplicatedStorage.Content.NewEnemies.Korblox Deathwalker.Stats
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 100000,
    RewardThreshold = 0.01,
    Speed = 1.5,
    AttackCooldown = 8,
    Scale = 1.5,
    Description = "The Deathwalker is one of the most powerful sorcerers in the history of The Korblox Empire. It transcends mortality, and the mere sight of it leaves enemies frozen in fear. After a battle, it is believed that the Deathwalker guides the fallen Korblox warriors into the afterlife while raising the souls of Redcliff soldiers, corrupting them into its devoted followers.",
    HealthPerDifficulty = {Easy = 40000, Mega = 200000, Impossible = 400000},
    Reward = {Easy = 80000, Mega = 120000, Impossible = 150000},
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.FreezeImmune,
    },
    Moveset = {
        Swing = {
            Range = 24,
            Angle = 120,
            StunTime = 4,
            Damage = 1000,
            Cooldown = 40,
        },
        Meteor = {
            Range = 30,
            Radius = 10,
            Count = 10,
            ExplosionRadius = 4,
            StunTime = 5,
            Damage = 500,
            Cooldown = 60,
        },
        LaserSweep = {
            Range = 35,
            Radius = 3,
            StunTime = 8,
            Damage = 10000,
            Angle = 360,
            AnglePerSecond = 180,
            BeamRange = 200,
            Cooldown = 90,
            DamageRange = 15,
            spreadAngle = 6,
            spreadAngleStart = 10,
            Time = 8,
        },
    },
}