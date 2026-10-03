-- Script path: ReplicatedStorage.Content.Unit.Guard3.Stats
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 25,
        Health = 50,
        Speed = 4,
        Cooldown = 0.2,
        Damage = 2,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
    Golden = {
        Range = 25,
        Health = 50,
        Speed = 4,
        Cooldown = 0.15,
        Damage = 4,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {},
    },
}