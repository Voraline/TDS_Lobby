-- Script path: ReplicatedStorage.Content.Unit.Executioner Skeleton.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Health = 3000,
        Defense = 25,
        Speed = 2,
        Cooldown = 6,
        Range = 32,
        Damage = 75,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
            [Enum.StatusEffect.LeadDetection] = true,
        },
        Attributes = {},
    },
}