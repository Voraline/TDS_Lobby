-- Script path: ReplicatedStorage.Content.Unit.Mark1Rocket.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 30,
        Health = 500,
        Speed = 2,
        Cooldown = 0.2,
        Damage = 10,
        ExplosionRootDamage = 150,
        ExplosionDamage = 25,
        RocketSpeed = 50,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}