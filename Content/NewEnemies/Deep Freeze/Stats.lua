-- Script path: ReplicatedStorage.Content.NewEnemies.Deep Freeze.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 6000,
    Speed = 3.4,
    Defense = 0,
    Scale = 1.6,
    RewardThreshold = 0.2,
    Description = "The Deep Freeze is a formidable addition to the Frost Army. These slow but sturdy creatures clear paths for smaller units. Protected by reinforced armor as they travel the battlefield, Deep Freezes are natural frontline leaders in combat.",
    HealthPerDifficulty = {Easy = 800, Hard = 2500, Frost = 7500},
    Reward = {Easy = 1000, Hard = 2500, Frost = 4500},
    Attributes = {
        Enum.Modifier.Lead,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}