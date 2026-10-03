-- Script path: ReplicatedStorage.Content.Enemies.Grave Digger.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 1000,
    Speed = 1,
    MaxHealth = 40000,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}