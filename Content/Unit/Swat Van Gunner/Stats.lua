-- Script path: ReplicatedStorage.Content.Unit.Swat Van Gunner.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 25,
        Health = 1500,
        Defense = 15,
        Speed = 7,
        Cooldown = 0.15,
        Damage = 10,
        ExplosionDamage = 550,
        ExplosionRadius = 6,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}