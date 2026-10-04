-- Script path: ReplicatedStorage.Content.NewEnemies.Mega Frost Mystery.Stats
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    Scale = 2,
    MaxHealth = 600,
    RewardThreshold = 0.5,
    Description = "The Frost Mystery is considered one of the most terrifying creatures in the Frost Realm. It has an exoskeleton made of tough solid ice, while its insides contain water that cannot be frozen. According to legend, these beings are created from those who fall through frozen lakes and never resurface. The shadowy figure visible within is believed to be one of these unfortunate souls. It releases frost enemies with modifiers upon death.",
    HealthPerDifficulty = {Easy = 125, Hard = 300, Frost = 3500},
    Reward = {Easy = 175, Hard = 350, Frost = 2100},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
    Summon = {
        Amount = 5,
        Spawns = {
            {
                MaxWave = 40,
                Enemies = {
                    {Name = "Packed Ice", Chance = 30, Delay = 0.7},
                    {Name = "Yeti", Chance = 30, Delay = 0.5},
                    {Name = "Frost Acolyte", Chance = 20, Delay = 0.8},
                    {Name = "Elite Snow Golem", Chance = 20, Delay = 0.8},
                },
            },
        },
        Modifiers = {{Chance = 100}},
    },
}