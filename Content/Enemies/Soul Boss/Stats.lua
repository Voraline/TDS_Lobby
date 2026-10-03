-- Script path: ReplicatedStorage.Content.Enemies.Soul Boss.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 4000,
    NoImmune = true,
    IsHardcore = true,
    Attributes = {Enum.Modifier.Hidden, Enum.Modifier.Ghost},
}