-- Script path: ReplicatedStorage.Content.NewEnemies.Nuclear Guardian.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.4,
    MaxHealth = 175000,
    Defense = 20,
    Reward = 250000,
    RewardThreshold = 0.5,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}