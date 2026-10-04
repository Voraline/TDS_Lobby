-- Script path: ReplicatedStorage.Content.NewEnemies.Void Grave Digger.Stats
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Void Keeper",
    Description = "The Void Keeper is a specialized variant of Slow King who wallowed in the depths of their agony and decided they had to take on the task of burying their kingdom. After a realm collapses, the Void Keeper will quietly carry the dead and bury them. Some of the corpses will turn into food for the flora while others will either reanimate into Odds or decompose into skeletons. It is not known how the Void Keeper feels about this, but to this day it still quietly shovels away grave after grave.",
    Speed = 2.25,
    Scale = 1.3,
    RageModePerc = 0.25,
    RageModeSpeed = 3.5,
    MaxHealth = 30000,
    AwardBadgeOnDeath = {id = 2217302268901977, modes = {mode = "Hardcore", difficulty = "Hard"}},
    HealthPerDifficulty = {Hard = 40000, Easy = 100000},
    Reward = {Hard = 10000, Easy = 45000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
    GlobalCooldown = NumberRange.new(4, 4),
    AttackInfo = {
        Shovel = {
            Cooldown = 30,
            Range = 20,
            BurstRadius = 5,
            dtMultiplier = 8,
            Gravity = -0.7,
            StunLength = 4,
            Damage = 150,
            SpreadRange = NumberRange.new(3, 5),
            Burst = NumberRange.new(8, 8),
            RandomOffset = NumberRange.new(2, 8),
            Velocity = NumberRange.new(2, 4),
        },
        Summon = {
            Cooldown = 27.5,
            IntroLength = 1.75,
            OutroLength = 2.25,
            SpeedBoostLength = 16,
            Length = NumberRange.new(4),
            Spawns = {
                {Name = "Voidling", Chance = 6, Delay = 0.55},
                {Name = "Elite Lead", Chance = 32, Delay = 0.125},
                {Name = "Mandrake", Chance = 62, Delay = 0.125},
            },
        },
        Stomp = {Cooldown = 35, Radius = 25, StunLength = 3, Damage = 150},
    },
}