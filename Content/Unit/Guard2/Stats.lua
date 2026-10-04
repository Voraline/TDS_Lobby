-- Script path: ReplicatedStorage.Content.Unit.Guard2.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 20,
        Health = 10,
        Speed = 4,
        Cooldown = 0.5,
        Damage = 2,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
    Golden = {
        Range = 20,
        Health = 10,
        Speed = 4,
        Cooldown = 0.3,
        Damage = 3,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
}