-- Script path: ReplicatedStorage.Content.Unit.Humvee 2.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 5,
        Health = 100,
        Speed = 8,
        Cooldown = 0,
        Damage = 0,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}