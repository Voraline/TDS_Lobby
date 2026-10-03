-- Script path: ReplicatedStorage.Content.NewEnemies.Guard Plush.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 2500,
    Shield = 1500,
    Reward = 6000,
    RewardThreshold = 0.25,
    Attributes = {Enum.Modifier.Lead, Enum.Modifier.StunImmune},
}