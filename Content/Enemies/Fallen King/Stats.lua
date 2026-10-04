-- Script path: ReplicatedStorage.Content.Enemies.Fallen King.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 15000,
    Speed = 1.5,
    MaxHealth = 150000,
    Summon = {InitialCooldown = 5},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}