-- Script path: ReplicatedStorage.Content.Unit.Ripped Elf.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 60,
        Health = 1000,
        Speed = 2,
        Cooldown = 7,
        Damage = 375,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {ExplosionRadius = 4, SnowballSpeed = 15},
    },
}