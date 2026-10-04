-- Script path: ReplicatedStorage.Content.NewEnemies.Minigunner.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.25,
    MaxHealth = 30000,
    Reward = 40000,
    RewardThreshold = 0.1,
    Defense = 30,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}