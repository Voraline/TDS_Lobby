-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Wraith.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Shivergeist",
    Health = 3750,
    RewardThreshold = 0.5,
    Speed = 5.25,
    Defense = 0,
    Scale = 1.35,
    BuffAmount = 33,
    BuffRadius = 15,
    BuffDuration = 5,
    BuffDisplayDuration = 0,
    Description = "",
    HealthPerDifficulty = {Frost = 3750},
    Reward = {Frost = 2250},
    Attributes = {
        Enum.Modifier.Hidden,
        Enum.Modifier.Ghost,
        Enum.Modifier.StunImmune,
    },
}