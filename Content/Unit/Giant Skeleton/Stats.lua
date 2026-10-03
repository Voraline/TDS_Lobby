-- Script path: ReplicatedStorage.Content.Unit.Giant Skeleton.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 1200,
        Speed = 3.5,
        Range = 2,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}