-- Script path: ReplicatedStorage.Content.Enemies.Ghost Knight.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 500,
    NoBurn = true,
    NoImmune = true,
    Defense = 25,
    Archived = true,
    Attributes = {
        Enum.Modifier.Hidden,
        Enum.Modifier.ExplosionImmune,
        Enum.Modifier.Ghost,
    },
}