-- Script path: ReplicatedStorage.Content.Unit.Sentry4.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        ExplosionDamage = 60,
        ExplosionRadius = 5,
        Range = 24,
        Health = 1000,
        Lifetime = 60,
        Speed = 1.5,
        IgnoreCollisionDamage = true,
        Cooldown = 0.125,
        Damage = 3,
        Lifespan = 60,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {SendTime = 1.75, ScrapCost = 340},
    },
}