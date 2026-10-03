-- Script path: ReplicatedStorage.Content.Enemies.Molten Titan.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.5,
    MaxHealth = 3500,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FireImmune},
}