-- Script path: ReplicatedStorage.Content.Unit.KingpinHitman.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            DisplayName = "Contractor",
            Health = 400,
            Speed = 3.5,
            Damage = 170,
            Range = 35,
            Cooldown = 2,
            Lifespan = 75,
            Detections = {
                [Enum.StatusEffect.HiddenDetection] = true,
                [Enum.StatusEffect.FlyingDetection] = true,
                [Enum.StatusEffect.LeadDetection] = true,
            },
            Attributes = {StandByTime = 4, WeaponDrawTime = 0.7},
        },
        Upgrades = {},
    },
}