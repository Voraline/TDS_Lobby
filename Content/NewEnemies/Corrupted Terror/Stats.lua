-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Terror.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.75,
    RewardThreshold = 0.1,
    MaxHealth = 7500,
    Reward = 10000,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}