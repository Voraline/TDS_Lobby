-- Script path: ReplicatedStorage.Content.Unit.Railgun Tank.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 30,
        Health = 1600,
        Speed = 5,
        MissileTime = 2,
        ExplosionRadius = 8,
        ExplosionDamage = 75,
        Cooldown = 0.175,
        Damage = 22,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}