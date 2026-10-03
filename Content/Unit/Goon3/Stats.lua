-- Script path: ReplicatedStorage.Content.Unit.Goon3.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 20,
        Health = 275,
        Speed = 4,
        Cooldown = 0.12,
        Damage = 5,
        Lifespan = 150,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0.35, StandByTime = 3},
    },
    Golden = {
        Range = 24,
        Health = 300,
        Speed = 4,
        Cooldown = 0.12,
        Damage = 6,
        Lifespan = 150,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}