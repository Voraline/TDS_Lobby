-- Script path: ReplicatedStorage.Content.Unit.Snowball Elf.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 15,
        Speed = 6,
        Range = 17,
        Cooldown = 2,
        Damage = 4,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}