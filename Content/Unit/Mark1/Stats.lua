-- Script path: ReplicatedStorage.Content.Unit.Mark1.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 30,
        Health = 500,
        Speed = 2,
        Cooldown = 0.2,
        Damage = 10,
        ExplosionRootDamage = 100,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}