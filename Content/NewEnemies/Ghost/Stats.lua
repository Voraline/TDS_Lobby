-- Script path: ReplicatedStorage.Content.NewEnemies.Ghost.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 45,
    Reward = 50,
    Hidden = true,
    HealthPerDifficulty = {Badlands = 60},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}