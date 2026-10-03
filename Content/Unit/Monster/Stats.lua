-- Script path: ReplicatedStorage.Content.Unit.Monster.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 10,
        Health = 400000,
        Speed = 1.2,
        Cooldown = 0.6,
        Damage = 1500,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}