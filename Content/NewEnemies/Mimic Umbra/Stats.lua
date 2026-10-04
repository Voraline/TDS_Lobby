-- Script path: ReplicatedStorage.Content.NewEnemies.Mimic Umbra.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 16000,
    Defense = 25,
    Reward = 25000,
    RewardThreshold = 0.25,
    Archived = true,
    Attributes = {
        Enum.Modifier.FireImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.MoltenCorpse,
    },
}