-- Script path: ReplicatedStorage.Content.Enemies.Mimic Umbra.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 16000,
    Defense = 25,
    Archived = true,
    Attributes = {
        Enum.Modifier.FireImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.MoltenCorpse,
    },
}