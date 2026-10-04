-- Script path: ReplicatedStorage.Content.NewEnemies.Grandmother Ducky.Stats
-- Decompile time: 0.31 ms

return {
    Description = "Grandma Ducky is the sweetest, most endearing duck around. Full of love and compassion for all of the ducklings, she’ll spend countless hours telling them stories and baking them homemade buckwheat cookies. One by one she’ll sit each duckling on her lap and preen their little heads before sending them off to explore the world.",
    Speed = 4.5,
    MaxHealth = 150,
    Defense = 0,
    HealthPerDifficulty = {Easy = 250, Hard = 500},
    Reward = {Hard = 500, Easy = 500},
    Attributes = {},
    Summon = {
        Amount = 3,
        Spawns = {
            {
                MaxWave = 25,
                Enemies = {
                    {Name = "Aged Eggroll 1", Chance = 33, Delay = 0.1},
                    {Name = "Aged Eggroll 2", Chance = 34, Delay = 0.1},
                    {Name = "Aged Eggroll 3", Chance = 33, Delay = 0.1},
                },
            },
        },
        Modifiers = {{Chance = 100}},
    },
}