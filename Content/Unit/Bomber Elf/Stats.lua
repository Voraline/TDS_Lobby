-- Script path: ReplicatedStorage.Content.Unit.Bomber Elf.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 5,
        Speed = 12,
        Range = 3,
        Cooldown = 0,
        Damage = 45,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {ExplosionRadius = 5},
    },
}