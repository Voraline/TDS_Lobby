-- Script path: ReplicatedStorage.Content.Unit.Goon3.Stats-PVP
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 20,
        Health = 225,
        Speed = 4,
        Cooldown = 0.12,
        Damage = 6,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0.35, StandByTime = 3},
    },
    Golden = {
        Range = 20,
        Health = 225,
        Speed = 4,
        Cooldown = 0.1,
        Damage = 10,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}