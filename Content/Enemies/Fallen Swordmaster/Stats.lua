-- Script path: ReplicatedStorage.Content.Enemies.Fallen Swordmaster.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 15000,
    Speed = 1.5,
    MaxHealth = 250000,
    Reward = 125000,
    RewardThreshold = 0.5,
    IsHardcore = true,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}