-- Script path: ReplicatedStorage.Content.Unit.Swat Van.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Range = 5,
            Health = 750,
            Defense = 10,
            Speed = 7,
            Cooldown = 0,
            Damage = 0,
            ExplosionDamage = 350,
            ExplosionRadius = 6,
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
            },
            Attributes = {},
        },
        Upgrades = {{Speed = 7, Health = 1200, Defense = 15, ExplosionDamage = 450}},
    },
}