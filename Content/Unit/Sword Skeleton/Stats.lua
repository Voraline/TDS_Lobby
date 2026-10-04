-- Script path: ReplicatedStorage.Content.Unit.Sword Skeleton.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 120,
        Speed = 3.3,
        Range = 6,
        Cooldown = 0.7,
        Damage = 24,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}