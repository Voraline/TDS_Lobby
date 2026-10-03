-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Mystery.Stats
-- Decompile time: 0.32 ms

return {
    Scale = 1.1,
    Speed = 4.75,
    MaxHealth = 100,
    Description = "The Frost Mystery is considered one of the most terrifying creatures in the Frost Realm. It has an exoskeleton made of tough solid ice, while its insides contain water that cannot be frozen. According to legend, these beings are created from those who fall through frozen lakes and never resurface. The shadowy figure visible within is believed to be one of these unfortunate souls. It releases frost enemies with modifiers upon death.",
    HealthPerDifficulty = {Easy = 125, Hard = 300, Frost = 100},
    Reward = {Easy = 175, Hard = 350, Frost = 190},
    Summon = {
        Amount = 3,
        Spawns = {
            {
                MaxWave = 40,
                Enemies = {
                    {Name = "Snowman", Chance = 30, Delay = 0.4},
                    {Name = "Snow Minion", Chance = 15, Delay = 0.1},
                    {Name = "Elite Snowman", Chance = 25, Delay = 0.5},
                    {Name = "Cold Mist", Chance = 25, Delay = 0.7},
                },
            },
        },
        Modifiers = {{Chance = 100}},
    },
}