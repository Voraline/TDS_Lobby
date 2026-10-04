-- Script path: ReplicatedStorage.Content.Unit.Humvee.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 5,
        Health = 60,
        Speed = 8,
        Cooldown = 0,
        Damage = 0,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}