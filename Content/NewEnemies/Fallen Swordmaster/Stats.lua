-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Swordmaster.Stats
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Void Swordmaster",
    HealthScale = 1,
    Speed = 1.9,
    MaxHealth = 500000,
    RewardThreshold = 0.5,
    AwardBadgeOnDeath = {id = 414534201965758, modes = {mode = "Hardcore", difficulty = "Hard"}},
    HealthPerDifficulty = {Hardcore_Hard = 600000, Hardcore_Easy = 250000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    Reward = {Hardcore_Hard = 750000, Hardcore_Easy = 375000},
}