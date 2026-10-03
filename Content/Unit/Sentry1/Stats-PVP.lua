-- Script path: ReplicatedStorage.Content.Unit.Sentry1.Stats-PVP
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 18,
        ScrapCost = 16,
        Health = 20,
        Lifetime = 30,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 0.45,
        Damage = 2,
        Lifespan = 20,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {SendTime = 1.25, ScrapCost = 16},
    },
}