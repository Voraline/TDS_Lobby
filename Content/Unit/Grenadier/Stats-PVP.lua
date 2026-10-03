-- Script path: ReplicatedStorage.Content.Unit.Grenadier.Stats-PVP
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 50,
            ExplosionDamage = 28,
            Range = 18,
            Cooldown = 1.75,
            Speed = 2.5,
            Lifespan = 240,
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.LeadDetection] = true,
            },
            Attributes = {AimDelay = 0.25, StandByTime = 2, ExplosionRadius = 3, Velocity = 30},
        },
        Upgrades = {
            {
                Health = 125,
                ExplosionDamage = 50,
                Range = 19,
                Cooldown = 1.5,
                Lifespan = 240,
                Detections = {},
                Attributes = {ExplosionRadius = 4.5},
            },
            {
                Health = 300,
                ExplosionDamage = 80,
                Range = 20,
                Defense = 10,
                Cooldown = 1.25,
                Lifespan = 240,
                Attributes = {ExplosionRadius = 4.5},
            },
        },
    },
}