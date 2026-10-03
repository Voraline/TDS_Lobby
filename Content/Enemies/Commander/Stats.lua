-- Script path: ReplicatedStorage.Content.Enemies.Commander.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 250,
    Speed = 3.5,
    MaxHealth = 8000,
    Defense = 0,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}