-- Script path: ReplicatedStorage.Content.Enemies.Jaxe.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1,
    MaxHealth = 5000,
    Archived = true,
    Removed = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.Boss},
}