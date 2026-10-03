-- Script path: ReplicatedStorage.Content.Unit.KingpinHenchman.Stats
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            DisplayName = "Lackey",
            Health = 45,
            Speed = 3.5,
            Damage = 2,
            Range = 19,
            Cooldown = 0.22,
            Lifespan = 75,
            Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            Attributes = {StandByTime = 2},
        },
        Upgrades = {
            {
                Health = 75,
                Speed = 3.5,
                Damage = 5,
                Range = 23,
                Cooldown = 0.2,
                Lifespan = 75,
                Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            },
            {
                Health = 200,
                Speed = 3.5,
                Damage = 6,
                Range = 24.5,
                Cooldown = 0.16,
                Lifespan = 75,
                Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            },
            {
                Health = 300,
                Speed = 3.5,
                Damage = 7,
                Range = 25,
                Cooldown = 0.12,
                Lifespan = 75,
                Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            },
        },
    },
}