-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Titan.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    Defense = 25,
    RewardThreshold = 0.5,
    Scale = 1.2,
    HealthPerDifficulty = {PVP_midRanks = 4000, SummerHard = 1800, Molten = 9000},
    Reward = {PVP_midRanks = 6000, SummerHard = 1800, Molten = 15000},
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.MoltenCorpse,
    },
}