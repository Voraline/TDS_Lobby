-- Script path: ReplicatedStorage.Content.Enemies.Gold Guard.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 9000,
    NoSpecial = true,
    Archived = true,
    Removed = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}