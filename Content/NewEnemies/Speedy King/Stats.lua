-- Script path: ReplicatedStorage.Content.NewEnemies.Speedy King.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "The one time the Speedy King was not quick enough was when it came to saving what was left of his kingdom. Unlike the Slow King, the Speedy King fought the Void head on. In battle, their actions could have been described as desperate as they tried to face the Void Reaver. In the wake of their defeat the flowers bloomed, and now they sprint across the same flora they once fought against.",
    Speed = 6.5,
    MaxHealth = 3500,
    BuffAmount = 50,
    BuffRadius = 15,
    BuffDuration = 10,
    BuffDisplayDuration = 4,
    Scale = 1.15,
    HealthPerDifficulty = {Hard = 3500, Easy = 3000},
    Reward = {Hard = 1750, Easy = 1500},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}