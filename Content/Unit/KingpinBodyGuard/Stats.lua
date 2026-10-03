-- Script path: ReplicatedStorage.Content.Unit.KingpinBodyGuard.Stats
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            DisplayName = "Body Guard",
            Health = 400,
            Speed = 3.5,
            Damage = 4,
            Range = 18,
            Cooldown = 0.1,
            Lifespan = 60,
            IgnoreCollisionDamage = true,
            Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        },
        Upgrades = {
            {
                Health = 600,
                Damage = 7,
                Detections = {
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.FlyingDetection] = true,
                },
            },
            {
                Health = 1000,
                Damage = 10,
                Range = 20,
                Lifespan = 80,
                Detections = {
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.FlyingDetection] = false,
                },
            },
        },
    },
}