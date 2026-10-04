-- Script path: ReplicatedStorage.Content.Unit.Sentry1.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 18,
        ScrapCost = 8,
        Health = 100,
        Lifetime = 30,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 1,
        Damage = 2,
        Lifespan = 20,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {SendTime = 1.25, ScrapCost = 8},
    },
}