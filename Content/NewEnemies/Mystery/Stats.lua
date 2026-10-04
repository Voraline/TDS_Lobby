-- Script path: ReplicatedStorage.Content.NewEnemies.Mystery.Stats
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Mystery is still a mystery. It seems they have not decided upon what they wanted to become and instead choose to wander the Void. They like to watch from a distance, studying everyone from a distance. It’s not sure what it wants to become but perhaps they are window-shopping for a new identity. They have been seen trying to lure others into the darkness and if that happens, only one of them returns.",
    Speed = 5,
    Health = 100,
    Scale = 1.15,
    HealthPerDifficulty = {Hard = 260, Easy = 80, NilZone2 = 50},
    Reward = {Hard = 100, Easy = 40, NilZone2 = 20},
    Attributes = {},
    SpawnPools = {
        {{enemy = "Balloon", amount = 1}},
        {{enemy = "Phantom", amount = 1}},
        {{enemy = "Hefty", amount = 1}},
    },
    Summon = {
        Amount = 1,
        Spawns = {
            {
                MaxWave = 50,
                Enemies = {
                    {Name = "Phantom", Chance = 50, Delay = 0.1},
                    {Name = "Balloon", Chance = 20, Delay = 0.1},
                    {Name = "Hefty", Chance = 30, Delay = 0.1},
                },
            },
        },
        Modifiers = {},
    },
}