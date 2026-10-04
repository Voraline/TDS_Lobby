-- Script path: ReplicatedStorage.Content.NewEnemies.Circuit2.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Circuit",
    HealthScale = 0,
    Speed = 5,
    MaxHealth = 2500,
    RewardThreshold = 0.25,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    HealthPerDifficulty = {Trial = 1000},
    Reward = {PollutedWasteland = 3500, Trial = 1000},
}