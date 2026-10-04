-- Script path: ReplicatedStorage.Content.NewEnemies.Snowman.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 1.1,
    Health = 15,
    Speed = 3.5,
    Reward = 60,
    Description = "Snowmen are often found rolling balls of snow around fields of energized ice, hoping to create a friend. Being lonely creatures, they often roll snow balls as a group until more Snowmen are created. After some time, Snowmen will fight for dominance and entangle, becoming one giant Snow Golem. For fun, they seem to enjoy throwing snow balls at Frost Ravagers before running away.",
    HealthPerDifficulty = {Easy = 35, Hard = 75, Frost = 60},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}