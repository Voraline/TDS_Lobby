-- Script path: ReplicatedStorage.Content.NewEnemies.Undead Miner.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 3500,
    Reward = 4500,
    RewardThreshold = 0.5,
    Defense = 40,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}