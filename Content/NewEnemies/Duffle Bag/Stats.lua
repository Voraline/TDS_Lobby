-- Script path: ReplicatedStorage.Content.NewEnemies.Duffle Bag.Stats
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "",
    Speed = 1.9,
    MaxHealth = 2000,
    RewardThreshold = 0.25,
    Defense = 25,
    HealthPerDifficulty = {
        Map1AdidasEasy = 1200,
        Map1AdidasHard = 2500,
        Map2AdidasEasy = 1320,
        Map2AdidasHard = 2200,
        Map3AdidasEasy = 1320,
        Map3AdidasHard = 2200,
    },
    HealthPerGamemode = {
        Map1Adidas = {Easy = 1200, Hard = 2500},
        Map2Adidas = {Easy = 1320, Hard = 2200},
        Map3Adidas = {Easy = 1320, Hard = 2200},
    },
    Reward = {
        Map1AdidasEasy = 1500,
        Map1AdidasHard = 1875,
        Map2AdidasEasy = 1500,
        Map2AdidasHard = 1875,
        Map3AdidasEasy = 1500,
        Map3AdidasHard = 1500,
    },
    RewardPerGamemode = {
        Map1Adidas = {Easy = 1500, Hard = 1875},
        Map2Adidas = {Easy = 1500, Hard = 1875},
        Map3Adidas = {Easy = 1500, Hard = 1500},
    },
    Attributes = {},
}