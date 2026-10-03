-- Script path: ReplicatedStorage.Content.NewEnemies.Boombox.Stats
-- Decompile time: 0.25 ms

game:GetService("ReplicatedStorage")
return {
    Description = "",
    Speed = 2.8,
    MaxHealth = 60,
    Defense = 25,
    HealthPerDifficulty = {
        Map1AdidasEasy = 40,
        Map1AdidasHard = 60,
        Map2AdidasEasy = 50,
        Map2AdidasHard = 66,
        Map3AdidasEasy = 45,
        Map3AdidasHard = 66,
    },
    HealthPerGamemode = {
        Map1Adidas = {Easy = 40, Hard = 60},
        Map2Adidas = {Easy = 50, Hard = 66},
        Map3Adidas = {Easy = 45, Hard = 66},
    },
    Reward = {
        Map1AdidasEasy = 50,
        Map1AdidasHard = 60,
        Map2AdidasEasy = 55,
        Map2AdidasHard = 55,
        Map3AdidasEasy = 50,
        Map3AdidasHard = 55,
    },
    RewardPerGamemode = {
        Map1Adidas = {Easy = 50, Hard = 60},
        Map2Adidas = {Easy = 55, Hard = 55},
        Map3Adidas = {Easy = 50, Hard = 55},
    },
    Attributes = {},
}