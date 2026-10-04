-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Snow Golem.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Frostbane",
    Speed = 3.2,
    Scale = 1.45,
    MaxHealth = 650,
    RewardThreshold = 0.33,
    AmountSpawn = 10,
    Description = "",
    HealthPerDifficulty = {Easy = 150, Hard = 300, Frost = 3200},
    Reward = {Easy = 200, Hard = 300, Frost = 2400},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}