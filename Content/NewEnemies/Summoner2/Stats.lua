-- Script path: ReplicatedStorage.Content.NewEnemies.Summoner2.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Necromancer King",
    Scale = 1.25,
    Speed = 4,
    MaxHealth = 125000,
    RewardThreshold = 0.2,
    Archived = true,
    HealthPerDifficulty = {Trial = 25000},
    Reward = {Trial = 25000, PollutedWasteland = 200000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}