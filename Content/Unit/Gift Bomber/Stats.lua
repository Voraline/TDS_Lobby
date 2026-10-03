-- Script path: ReplicatedStorage.Content.Unit.Gift Bomber.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Health = 500,
        Speed = 3,
        Range = 25,
        Cooldown = 2,
        Damage = 60,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {ExplosionRadius = 4.5},
    },
}