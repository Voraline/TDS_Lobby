-- Script path: ReplicatedStorage.Content.NewEnemies.Ninja Toilet.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    MaxHealth = 100,
    Reward = 30,
    Hidden = true,
    HealthPerDifficulty = {Easy = 100, Intermediate = 120, Insane = 150},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}