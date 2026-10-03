-- Script path: ReplicatedStorage.Content.Unit.Sentry4.Stats-PVP
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        ExplosionDamage = 28,
        Range = 24,
        Health = 250,
        Lifetime = 60,
        Speed = 1.5,
        IgnoreCollisionDamage = true,
        Cooldown = 0.1,
        Damage = 8,
        Lifespan = 60,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {SendTime = 1.75, ScrapCost = 250},
    },
}