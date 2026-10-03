-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Lead.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Taking the same concept as the Lead, the Elite Lead are Swifts who have fallen victim to the same process as the Odds. Though, more careful consideration was taken for their armor due to mobility reasons.",
    Scale = 1.15,
    Speed = 3,
    Health = 600,
    Shield = 150,
    ShieldPerDifficulty = {Hard = 150, Easy = 150},
    HealthPerDifficulty = {Hard = 650, Easy = 400},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.Lead},
    Reward = {Hard = 200, Easy = 200},
}