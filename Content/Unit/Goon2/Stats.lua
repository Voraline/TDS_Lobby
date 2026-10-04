-- Script path: ReplicatedStorage.Content.Unit.Goon2.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 18.5,
        Health = 175,
        Speed = 4,
        Cooldown = 0.2,
        Damage = 5,
        Lifespan = 150,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0.35, StandByTime = 3},
    },
    Golden = {
        Range = 22.5,
        Health = 175,
        Speed = 4,
        Cooldown = 0.18,
        Damage = 5,
        Lifespan = 150,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}