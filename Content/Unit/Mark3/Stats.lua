-- Script path: ReplicatedStorage.Content.Unit.Mark3.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 35,
        Health = 1500,
        Speed = 2,
        Cooldown = 0.1,
        Damage = 10,
        ExplosionRootDamage = 350,
        ExplosionDamage = 60,
        RocketSpeed = 50,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}