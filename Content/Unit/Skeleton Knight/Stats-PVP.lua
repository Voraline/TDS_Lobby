-- Script path: ReplicatedStorage.Content.Unit.Skeleton Knight.Stats-PVP
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 250,
        Speed = 3.5,
        Range = 6,
        Cooldown = 0.65,
        Damage = 87,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}