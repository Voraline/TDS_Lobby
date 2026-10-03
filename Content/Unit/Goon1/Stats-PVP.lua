-- Script path: ReplicatedStorage.Content.Unit.Goon1.Stats-PVP
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 18,
        Health = 25,
        Speed = 4,
        Cooldown = 0.8,
        Damage = 2,
        Lifespan = 150,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
    Golden = {
        Range = 20,
        Health = 25,
        Speed = 4,
        Cooldown = 0.6,
        Damage = 3,
        Lifespan = 150,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}