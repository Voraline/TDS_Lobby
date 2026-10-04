-- Script path: ReplicatedStorage.Content.Unit.Guard1.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 20,
        Health = 10,
        Speed = 4,
        Cooldown = 1,
        Damage = 2,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
    Golden = {
        Range = 20,
        Health = 10,
        Speed = 4,
        Cooldown = 0.6,
        Damage = 3,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
}