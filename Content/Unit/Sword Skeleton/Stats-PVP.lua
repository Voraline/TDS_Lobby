-- Script path: ReplicatedStorage.Content.Unit.Sword Skeleton.Stats-PVP
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Health = 90,
        Speed = 3.5,
        Range = 6,
        Cooldown = 0.8,
        Damage = 20,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}