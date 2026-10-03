-- Script path: ReplicatedStorage.Content.NewEnemies.Wox.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 15000,
    Speed = 0.9,
    MaxHealth = 450000,
    Reward = 750000,
    RewardThreshold = 0.01,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}