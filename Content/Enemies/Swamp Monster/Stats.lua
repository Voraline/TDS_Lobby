-- Script path: ReplicatedStorage.Content.Enemies.Swamp Monster.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.35,
    MaxHealth = 65000,
    Archived = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.Boss},
}