-- Script path: ReplicatedStorage.Content.NewEnemies.Molten.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 90,
    Defense = 25,
    Speed = 3.75,
    HealthPerDifficulty = {SummerHard = 200},
    Reward = {Molten = 90, SummerHard = 100},
    Attributes = {Enum.Modifier.FireImmune, Enum.Modifier.MoltenCorpse},
}