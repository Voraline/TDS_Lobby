-- Script path: ReplicatedStorage.Content.Unit.Sentry2.Stats-PVP
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 20,
        ScrapCost = 32,
        Health = 40,
        Lifetime = 30,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 0.2,
        Damage = 2,
        Lifespan = 30,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {SendTime = 1.5, ScrapCost = 32},
    },
}