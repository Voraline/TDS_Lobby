-- Script path: ReplicatedStorage.Content.NewEnemies.Cavalry.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.25,
    MaxHealth = 15000,
    Reward = 17500,
    Defense = 25,
    RewardThreshold = 0.25,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}