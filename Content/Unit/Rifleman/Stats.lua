-- Script path: ReplicatedStorage.Content.Unit.Rifleman.Stats
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Defaults = {
            Health = 40,
            Damage = 5,
            Range = 20,
            Cooldown = 0.15,
            Speed = 3.5,
            Lifespan = 150,
            Attributes = {Burst = 6, BurstCool = 1, AimDelay = 0.35, StandByTime = 5},
        },
        Upgrades = {
            {
                Health = 80,
                Damage = 8,
                Range = 24,
                Lifespan = 150,
                Detections = {
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.FlyingDetection] = true,
                },
                Attributes = {Burst = 8, BurstCool = 1},
            },
            {
                Health = 275,
                Damage = 17,
                Range = 30,
                Lifespan = 150,
                Attributes = {Burst = 8, BurstCool = 1},
            },
        },
    },
}