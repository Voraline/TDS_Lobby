-- Script path: ReplicatedStorage.Content.NewEnemies.Gatekeeper.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 1.15,
    MaxHealth = 25000,
    Reward = 50000,
    RewardThreshold = 0.1,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}