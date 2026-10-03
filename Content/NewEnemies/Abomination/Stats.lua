-- Script path: ReplicatedStorage.Content.NewEnemies.Abomination.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 250,
    Speed = 8.5,
    MaxHealth = 25000,
    Defense = 30,
    Reward = 35000,
    RewardThreshold = 0.25,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}