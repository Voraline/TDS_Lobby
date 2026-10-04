-- Script path: ReplicatedStorage.Content.NewEnemies.Brute.Stats
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.1,
    MaxHealth = 17500,
    RewardThreshold = 0.05,
    HealthPerDifficulty = {
        Baby = 7500,
        Easy = 10000,
        Trial = 120000,
        SummerEasy = 10000,
        Chapter1Mission7 = 30000,
    },
    HealthPerGamemode = {Map3Adidas = {Easy = 32500, Hard = 75000}},
    Reward = {Trial = 40000, Easy = 40000, Chapter1Mission7 = 50000, Chapter0Mission4 = 20000},
    RewardPerGamemode = {Map3Adidas = {Easy = 45000, Hard = 56250}},
    Attributes = {},
    Moveset = {
        Smash = {Range = 10, StunTime = 3, Damage = 1000, Cooldown = 20},
        Throw = {
            MaxRange = 25,
            MinRange = 10,
            Radius = 5,
            StunTime = 5,
            Damage = 500,
            Cooldown = 30,
            SplitCount = 4,
            ShardMinTravelDist = 6,
            ShardMaxTravelDist = 10,
        },
    },
}