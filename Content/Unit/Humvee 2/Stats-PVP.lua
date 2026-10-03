-- Script path: ReplicatedStorage.Content.Unit.Humvee 2.Stats-PVP
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 5,
        Health = 100,
        Speed = 6,
        Cooldown = 0,
        Damage = 0,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = false,
        },
        Attributes = {},
    },
}