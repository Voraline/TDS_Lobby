-- Script path: ReplicatedStorage.Content.Unit.Mark5.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 50,
        Health = 10000,
        Defense = 30,
        Speed = 2,
        Cooldown = 0.1,
        Damage = 34,
        ExplosionRootDamage = 2000,
        ExplosionDamage = 60,
        RocketSpeed = 70,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {},
    },
}