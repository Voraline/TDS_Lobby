-- Script path: ReplicatedStorage.Content.Unit.Goon1.Stats
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 17,
        Health = 30,
        Speed = 4,
        Cooldown = 0.6,
        Damage = 3,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
    Golden = {
        Range = 17,
        Health = 40,
        Speed = 4,
        Cooldown = 0.6,
        Damage = 4,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}