-- Script path: ReplicatedStorage.Content.NewEnemies.Cobalt Guard.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 1.15,
    Description = "",
    MaxHealth = 125,
    Defense = 30,
    Speed = 3.25,
    RewardThreshold = 0.5,
    HealthPerDifficulty = {Act1 = 80, Act1Easy = 20, NilZone2 = 80},
    Reward = {Act1 = 120, Act1Easy = 60, NilZone2 = 80},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Lead},
}