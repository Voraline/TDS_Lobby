-- Script path: ReplicatedStorage.Content.Unit.Cannoneer Elf.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 20,
        Speed = 4,
        Range = 18,
        Cooldown = 0.5,
        Damage = 4,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {ProjectileSpeed = 35},
    },
}