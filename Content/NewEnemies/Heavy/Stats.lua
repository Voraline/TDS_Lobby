-- Script path: ReplicatedStorage.Content.NewEnemies.Heavy.Stats
-- Decompile time: 0.18 ms

game:GetService("ReplicatedStorage")
return {
    Speed = 2.8,
    MaxHealth = 60,
    Defense = 25,
    HealthPerDifficulty = {
        PizzaParty = 45,
        Badlands = 45,
        Intermediate = 45,
        Molten = 45,
        Fallen = 60,
        Frost = 80,
        PVP_lowRanks = 20,
        PVP_midRanks = 30,
        PVP_highRanks = 40,
        SummerHard = 60,
        Trial = 60,
    },
    Reward = {
        PizzaParty = 35,
        Badlands = 45,
        Intermediate = 25,
        Molten = 50,
        Fallen = 35,
        Frost = 50,
        PVP = 35,
        SummerHard = 45,
        Trial = 35,
    },
    Attributes = {},
}