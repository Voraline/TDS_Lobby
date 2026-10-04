-- Script path: ReplicatedStorage.Content.Unit.Elf.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 1.5,
        Health = 15,
        Speed = 8,
        Cooldown = 0,
        Damage = 0,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}