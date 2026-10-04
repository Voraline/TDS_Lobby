-- Script path: ReplicatedStorage.Content.Unit.Mark4.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 50,
        Health = 2500,
        Speed = 2,
        Cooldown = 0.1,
        Damage = 22,
        ExplosionRootDamage = 500,
        ExplosionDamage = 60,
        RocketSpeed = 50,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}