-- Script path: ReplicatedStorage.Content.Unit.Humvee 3.Stats
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Range = 30,
        Health = 100,
        Speed = 5,
        Cooldown = 0.225,
        Damage = 4,
        Detections = {
            [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
        },
        Attributes = {},
    },
}