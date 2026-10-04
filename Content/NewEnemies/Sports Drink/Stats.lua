-- Script path: ReplicatedStorage.Content.NewEnemies.Sports Drink.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "",
    Speed = 4,
    MaxHealth = 1300,
    HealthPerDifficulty = {
        Map1AdidasEasy = 500,
        Map1AdidasHard = 1000,
        Map2AdidasEasy = 550,
        Map2AdidasHard = 880,
        Map3AdidasEasy = 550,
        Map3AdidasHard = 880,
    },
    HealthPerGamemode = {
        Map1Adidas = {Easy = 500, Hard = 1000},
        Map2Adidas = {Easy = 550, Hard = 880},
        Map3Adidas = {Easy = 550, Hard = 880},
    },
    Reward = {
        Map1AdidasEasy = 625,
        Map1AdidasHard = 1100,
        Map2AdidasEasy = 625,
        Map2AdidasHard = 750,
        Map3AdidasEasy = 625,
        Map3AdidasHard = 750,
    },
    RewardPerGamemode = {
        Map1Adidas = {Easy = 625, Hard = 1100},
        Map2Adidas = {Easy = 625, Hard = 750},
        Map3Adidas = {Easy = 625, Hard = 750},
    },
    Attributes = {},
}