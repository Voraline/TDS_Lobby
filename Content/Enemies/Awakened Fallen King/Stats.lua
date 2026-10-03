-- Script path: ReplicatedStorage.Content.Enemies.Awakened Fallen King.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 15000,
    Speed = 1.5,
    MaxHealth = 150000,
    Archived = true,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}