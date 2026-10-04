-- Script path: ReplicatedStorage.Content.Unit.Gunner Elf.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            Health = 25,
            Speed = 4,
            Range = 22,
            Cooldown = 0.4,
            Damage = 4,
            Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            Attributes = {ProjectileSpeed = 35, BurstAmount = 5, BurstCooldown = 1},
        },
        Upgrades = {
            {
                Health = 25,
                Range = 22,
                Cooldown = 0.35,
                Damage = 4,
                Detections = {
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.FlyingDetection] = false,
                },
            },
        },
    },
}