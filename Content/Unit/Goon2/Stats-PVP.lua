-- Script path: ReplicatedStorage.Content.Unit.Goon2.Stats-PVP
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 20,
        Health = 125,
        Speed = 4,
        Cooldown = 0.25,
        Damage = 5,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0.35, StandByTime = 3},
    },
    Golden = {
        Range = 17.5,
        Health = 125,
        Speed = 4,
        Cooldown = 0.18,
        Damage = 5,
        Lifespan = 200,
        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
        Attributes = {AimDelay = 0, StandByTime = 3},
    },
}