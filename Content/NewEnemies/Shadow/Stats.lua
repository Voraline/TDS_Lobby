-- Script path: ReplicatedStorage.Content.NewEnemies.Shadow.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 20,
    HealthPerDifficulty = {PollutedWasteland = 50},
    Reward = {PollutedWasteland = 50},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}