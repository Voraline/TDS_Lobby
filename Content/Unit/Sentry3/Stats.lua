-- Script path: ReplicatedStorage.Content.Unit.Sentry3.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 22,
        ScrapCost = 150,
        Health = 750,
        Lifespan = 45,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 0.15,
        Damage = 3,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {SendTime = 1.75, ScrapCost = 150},
    },
}