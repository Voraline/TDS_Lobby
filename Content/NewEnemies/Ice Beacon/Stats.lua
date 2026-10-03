-- Script path: ReplicatedStorage.Content.NewEnemies.Ice Beacon.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 2500,
    Speed = 0.001,
    Scale = 1.5,
    HealthPerDifficulty = {Easy = 5000, Hard = 40000, Frost = 6250},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.Flying},
}