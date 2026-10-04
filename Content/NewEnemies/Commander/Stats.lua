-- Script path: ReplicatedStorage.Content.NewEnemies.Commander.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 250,
    Speed = 3.5,
    MaxHealth = 8000,
    Reward = 12000,
    RewardThreshold = 0.25,
    Defense = 0,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}