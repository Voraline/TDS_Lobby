-- Script path: ReplicatedStorage.Content.Enemies.Gold Titan.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 6000,
    Speed = 1,
    MaxHealth = 100000,
    NoSpecial = true,
    Archived = true,
    Removed = true,
    Attributes = {
        Enum.Modifier.ExplosionImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.Boss,
    },
}