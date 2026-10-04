-- Script path: ReplicatedStorage.Content.Enemies.Abomination.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 250,
    Speed = 6,
    MaxHealth = 20000,
    Defense = 20,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}