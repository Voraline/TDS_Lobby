-- Script path: ReplicatedStorage.Content.NewEnemies.Super Toxic.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Scale = 1.3,
    Speed = 3,
    MaxHealth = 85000,
    Defense = 15,
    Reward = 45000,
    RewardThreshold = 0.1,
    Archived = true,
    Attributes = {Enum.Modifier.MoltenCorpse, Enum.Modifier.FreezeImmune},
}