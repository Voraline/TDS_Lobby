-- Script path: ReplicatedStorage.Content.Enemies.Summoner Boss.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 250,
    Speed = 2,
    MaxHealth = 8000,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}