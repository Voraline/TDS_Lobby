-- Script path: ReplicatedStorage.Content.Unit.Gunner APC.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Default = {
        Range = 30,
        Health = 200,
        Speed = 4,
        Damage = 7,
        Cooldown = 0.2,
        Detections = {
            [Enum.StatusEffect.HiddenDetection] = true,
            [Enum.StatusEffect.FlyingDetection] = true,
        },
    },
}