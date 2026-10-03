-- Script path: ReplicatedStorage.Content.Enemies.Soul.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 7,
    MaxHealth = 800,
    NoImmune = true,
    IsHardcore = true,
    Attributes = {Enum.Modifier.Hidden, Enum.Modifier.Ghost},
}