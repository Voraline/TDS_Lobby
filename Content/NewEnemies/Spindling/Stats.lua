-- Script path: ReplicatedStorage.Content.NewEnemies.Spindling.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    Health = 5000,
    RewardThreshold = 0.5,
    Description = "The Spindling is a fast-charging enemy that was created out of whim. The Narrator doesn't remember why he created the Spindling, but then again, after thousands of years one wouldn't normally be sane of mind.",
    HealthPerDifficulty = {Hard = 6000, Easy = 3750},
    Reward = {Hard = 5000, Easy = 4000},
    Attributes = {},
}