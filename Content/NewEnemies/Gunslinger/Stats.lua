-- Script path: ReplicatedStorage.Content.NewEnemies.Gunslinger.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 15000,
    Speed = 0.8,
    MaxHealth = 600000,
    Reward = 1000000,
    RewardThreshold = 0.01,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}