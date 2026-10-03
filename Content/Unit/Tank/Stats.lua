-- Script path: ReplicatedStorage.Content.Unit.Tank.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 30,
        Health = 500,
        Speed = 5,
        ExplosionRadius = 6,
        MissileTime = 2,
        Cooldown = 0.225,
        ExplosionDamage = 40,
        Damage = 8,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}