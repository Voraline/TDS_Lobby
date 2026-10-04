-- Script path: ReplicatedStorage.Content.Unit.Hallow Guard.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 2000,
        Defense = 15,
        Speed = 3.5,
        Range = 2,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}