-- Script path: ReplicatedStorage.Content.NewEnemies.Trophy.Stats
-- Decompile time: 0.32 ms

return {
    Description = "",
    DisplayName = "Felipe",
    Speed = 1.2,
    MaxHealth = 17500,
    RewardThreshold = 0.05,
    HealthPerDifficulty = {Map3AdidasEasy = 45000, Map3AdidasHard = 75000},
    Reward = {Map3AdidasEasy = 45000, Map3AdidasHard = 56250},
    HealthPerGamemode = {Map3Adidas = {Easy = 45000, Hard = 80000}},
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
            ThrowDelay = 0.1,
        },
    },
}