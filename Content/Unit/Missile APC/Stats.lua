-- Script path: ReplicatedStorage.Content.Unit.Missile APC.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 25,
        Health = 300,
        Speed = 4,
        ExplosionRadius = 5,
        Cooldown = 2,
        ExplosionDamage = 40,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = false,
        },
        Attributes = {},
    },
}