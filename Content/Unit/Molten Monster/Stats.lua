-- Script path: ReplicatedStorage.Content.Unit.Molten Monster.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Speed = 1,
        Health = 25000,
        Defense = 200,
        Damage = 600,
        SwipeRange = 12,
        SwipeFOV = 120,
        SwipeCooldown = 1.25,
        StandByTime = 3,
        BurnTime = 2.5,
        BurnDamage = 500,
        BurnTick = 0.5,
        DefenseMelt = 0,
        ExplosionDamage = 1500,
        ExplosionRadius = 16,
        Range = 50,
        FireCooldown = 8,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.FlyingDetection] = true,
        },
    },
}