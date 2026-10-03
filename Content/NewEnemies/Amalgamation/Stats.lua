-- Script path: ReplicatedStorage.Content.NewEnemies.Amalgamation.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 150,
    Speed = 3,
    MaxHealth = 15000,
    Reward = 25000,
    RewardThreshold = 0.25,
    Archived = true,
    Removed = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}