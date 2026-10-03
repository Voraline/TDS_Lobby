-- Script path: ReplicatedStorage.Content.NewEnemies.Nuclear Monster.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 1.4,
    Speed = 1.25,
    MaxHealth = 2000000,
    Reward = 1000000,
    RewardThreshold = 0.01,
    Defense = 0,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}