-- Script path: ReplicatedStorage.Content.Enemies.Fallen Reaper.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 600,
    IsHardcore = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.StunImmune},
}