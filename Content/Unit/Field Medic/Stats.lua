-- Script path: ReplicatedStorage.Content.Unit.Field Medic.Stats
-- Decompile time: 0.19 ms

return {
    Default = {
        Defaults = {
            Health = 300,
            Range = 35,
            Cooldown = 0.2,
            Speed = 2.5,
            Damage = 0,
            Lifespan = 150,
            Detections = {},
            Attributes = {HealPerSecond = 75, MaxTargets = 8, Shield = true, ShieldCooldown = 15},
        },
        Upgrades = {{Health = 600, Lifespan = 150, Attributes = {HealPerSecond = 100, MaxTargets = 10}}},
    },
}