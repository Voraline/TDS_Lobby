-- Script path: ReplicatedStorage.Content.Enemies.Nuclear Guardian.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 80000,
    Defense = 50,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}