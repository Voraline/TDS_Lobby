-- Script path: ReplicatedStorage.Content.Enemies.Shotgunner.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.1,
    MaxHealth = 2500,
    Defense = 30,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}