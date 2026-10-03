-- Script path: ReplicatedStorage.Content.Enemies.Balloon Kid.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 500,
    Shield = 750,
    Attributes = {
        Enum.Modifier.Flying,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}