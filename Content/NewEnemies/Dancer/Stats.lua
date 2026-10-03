-- Script path: ReplicatedStorage.Content.NewEnemies.Dancer.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.25,
    Scale = 1.2,
    Health = 3500,
    Description = "When Dancers take the stage, their fractured masks conceal the agonized expressions of those trapped behind them. Known for their flexibility, they practice endlessly until dance becomes the only movement their bodies can remember.",
    HealthPerDifficulty = {Hard = 3500, Easy = 1750},
    Reward = {Hard = 2000, Easy = 2000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}