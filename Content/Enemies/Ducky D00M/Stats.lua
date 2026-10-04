-- Script path: ReplicatedStorage.Content.Enemies.Ducky D00M.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 250000,
    Archived = true,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}