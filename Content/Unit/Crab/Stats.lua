-- Script path: ReplicatedStorage.Content.Unit.Crab.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 25,
        Speed = 2.5,
        Range = 2,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}