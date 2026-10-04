-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Crook Boss.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Null Crook Boss",
    Description = "Null Crook Boss entered the realm with his Goons in tow. For Crook Boss, it was like a rival gang stepping into his territory. He adjusted his hat; the Null Crook Boss straightened his jacket. Standing face to face, they stared each other down clutching their weapons, and in a flash, they all drew.",
    Speed = 3.25,
    Scale = 1.2,
    Health = 2000,
    HealthPerDifficulty = {
        Act1 = 750,
        Act2 = 3000,
        Act3 = 1750,
        Act1Easy = 350,
        Act2Easy = 1250,
        Act3Easy = 900,
    },
    Reward = {
        Act1 = 1000,
        Act2 = 3000,
        Act3 = 1200,
        Act1Easy = 800,
        Act2Easy = 2250,
        Act3Easy = 1200,
    },
    Attributes = {},
}