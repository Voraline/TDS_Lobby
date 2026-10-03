-- Script path: ReplicatedStorage.Content.Unit.Grenadier.Stats
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 50,
            ExplosionDamage = 20,
            Range = 19,
            Cooldown = 1.4,
            Speed = 2.5,
            Lifespan = 150,
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.LeadDetection] = true,
            },
            Attributes = {AimDelay = 0.25, StandByTime = 5, ExplosionRadius = 4.5, Velocity = 30},
        },
        Upgrades = {
            {
                Health = 135,
                ExplosionDamage = 30,
                Range = 20,
                Cooldown = 1.3,
                Lifespan = 150,
                Detections = {},
                Attributes = {ExplosionRadius = 5},
            },
            {
                Health = 325,
                ExplosionDamage = 40,
                Range = 21.5,
                Defense = 10,
                Cooldown = 1.2,
                Lifespan = 150,
                Attributes = {ExplosionRadius = 6},
            },
        },
    },
}