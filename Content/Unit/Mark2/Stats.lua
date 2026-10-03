-- Script path: ReplicatedStorage.Content.Unit.Mark2.Stats
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 35,
        Health = 1000,
        Speed = 2,
        Cooldown = 0.15,
        Damage = 12,
        ExplosionRootDamage = 200,
        ExplosionDamage = 40,
        RocketSpeed = 50,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}