-- Script path: ReplicatedStorage.Content.Unit.Sentry2.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 20,
        ScrapCost = 32,
        Health = 400,
        Lifetime = 30,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 0.2,
        Damage = 1,
        Lifespan = 30,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {SendTime = 1.5, ScrapCost = 32},
    },
}