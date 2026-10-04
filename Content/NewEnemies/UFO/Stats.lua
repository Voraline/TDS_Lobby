-- Script path: ReplicatedStorage.Content.NewEnemies.UFO.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 60,
    Reward = 1000,
    Defense = 30,
    HealthPerDifficulty = {PlsDonate = 500, PlsDonateHard = 1000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}