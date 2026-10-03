-- Script path: ReplicatedStorage.Content.Enemies.Molten Boss.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 2500,
    Speed = 1,
    MaxHealth = 70000,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.FireImmune},
}