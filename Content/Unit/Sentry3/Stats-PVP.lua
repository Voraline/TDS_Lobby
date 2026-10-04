-- Script path: ReplicatedStorage.Content.Unit.Sentry3.Stats-PVP
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 20,
        ScrapCost = 140,
        Health = 60,
        Lifespan = 45,
        Speed = 1.25,
        IgnoreCollisionDamage = true,
        Cooldown = 0.15,
        Damage = 5,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {SendTime = 1.75, ScrapCost = 120},
    },
}