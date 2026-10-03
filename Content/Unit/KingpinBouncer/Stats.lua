-- Script path: ReplicatedStorage.Content.Unit.KingpinBouncer.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            DisplayName = "Bouncer",
            Health = 500,
            Speed = 5,
            Damage = 25,
            Range = 8,
            Cooldown = 0.5,
            Defense = 0,
            Lifespan = 75,
            Detections = {
                [Enum.StatusEffect.LeadDetection] = true,
                [Enum.StatusEffect.HiddenDetection] = true,
            },
            Attributes = {StandByTime = 3},
        },
        Upgrades = {
            {Health = 750, Defense = 10, Damage = 35},
            {Health = 1000, Defense = 15, Damage = 40, Range = 8.5},
        },
    },
}