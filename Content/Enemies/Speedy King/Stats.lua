-- Script path: ReplicatedStorage.Content.Enemies.Speedy King.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    MaxHealth = 6000,
    IsHardcore = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}