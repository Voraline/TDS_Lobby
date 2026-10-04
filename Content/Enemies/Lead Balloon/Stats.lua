-- Script path: ReplicatedStorage.Content.Enemies.Lead Balloon.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Shield = 600,
    Speed = 4.25,
    MaxHealth = 250,
    IsHardcore = true,
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.Lead},
}