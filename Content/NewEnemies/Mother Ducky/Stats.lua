-- Script path: ReplicatedStorage.Content.NewEnemies.Mother Ducky.Stats
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Mother Ducky is the heart and soul of the Duck Army, keeping everyone in line with her firm but loving approach. She takes special pride in mentoring younger ducks, teaching them important life lessons and filling their hearts with ambition with her stories. All ducks, both big and small, find comfort beneath her nurturing wings. ",
    Speed = 2.5,
    SpawnCount = 3,
    Health = 80,
    RewardThreshold = 0.5,
    Defense = 0,
    HealthPerDifficulty = {Easy = 100, Hard = 200},
    Reward = {Easy = 300, Hard = 300},
    Attributes = {},
    Summon = {
        Amount = 3,
        Spawns = {
            {
                MaxWave = 25,
                Enemies = {
                    {Name = "Eggroll 1", Chance = 33, Delay = 0.1},
                    {Name = "Eggroll 2", Chance = 34, Delay = 0.1},
                    {Name = "Eggroll 3", Chance = 33, Delay = 0.1},
                },
            },
        },
        Modifiers = {{Chance = 100}},
    },
}