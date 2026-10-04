-- Script path: ReplicatedStorage.Content.NewEnemies.Grave Digger.Stats
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 1000,
    Speed = 1.15,
    MaxHealth = 40000,
    RewardThreshold = 0.1,
    HealthPerDifficulty = {PVP_lowRanks = 30000, Trial = 200000, Chapter1Mission8 = 50000},
    Reward = {Trial = 50000, Easy = 200000, Casual = 120000, Chapter1Mission8 = 150000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
    GlobalCooldown = NumberRange.new(5, 25),
    AttackInfo = {
        Shovel = {
            Cooldown = 45,
            Range = 16,
            BurstRadius = 6,
            dtMultiplier = 8,
            Gravity = -0.7,
            StunLength = 3,
            Damage = 700,
            SpreadRange = NumberRange.new(3, 5),
            Burst = NumberRange.new(3, 7),
            RandomOffset = NumberRange.new(2, 8),
            Velocity = NumberRange.new(2, 4),
        },
        Summon = {
            Cooldown = 35,
            IntroLength = 2,
            OutroLength = 2,
            Length = NumberRange.new(8),
            Spawns = {
                {Name = "Normal", Chance = 15, Delay = 0.05},
                {Name = "Speedy", Chance = 15, Delay = 0.05},
                {Name = "Slow", Chance = 14, Delay = 0.1},
                {Name = "Skeleton", Chance = 14, Delay = 0.1},
                {Name = "Bolt", Chance = 14, Delay = 0.2},
                {Name = "Normal Boss", Chance = 14, Delay = 0.2},
                {Name = "Hazmat", Chance = 14, Delay = 0.3},
            },
        },
        Stomp = {Cooldown = 60, Radius = 20, StunLength = 4, Damage = 900},
    },
}