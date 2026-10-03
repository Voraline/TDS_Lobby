-- Script path: ReplicatedStorage.Content.NewEnemies.Voodoo Doll.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 4000,
    Shield = 2500,
    Reward = 8000,
    RewardThreshold = 0.25,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}