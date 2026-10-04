-- Script path: ReplicatedStorage.Content.Unit.Skeleton Knight.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 235,
        Defense = 15,
        Speed = 3.3,
        Range = 6,
        Cooldown = 0.7,
        Damage = 87,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}