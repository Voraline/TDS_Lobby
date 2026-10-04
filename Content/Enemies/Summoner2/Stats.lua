-- Script path: ReplicatedStorage.Content.Enemies.Summoner2.Stats
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    ZombieType = "Frost",
    Speed = 3.25,
    MaxHealth = 60000,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}