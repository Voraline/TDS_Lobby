-- Script path: ReplicatedStorage.Content.NewEnemies.Titus.Stats
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.6,
    Health = 40000,
    Reward = 200000,
    RewardThreshold = 0.05,
    Defense = 10,
    HealthPerDifficulty = {Act1Easy = 15000, Act1 = 40000, Act3 = 80000, Act3Easy = 20000},
    Attributes = {Enum.Modifier.Boss},
    GlobalCoolDown = {5, 10},
    Attacks = {
        voidStream = {
            CoolDown = 30,
            StartCoolDown = 10,
            Range = 45,
            Debuff = 60,
            Length = 5,
            HealingAmount = 15,
        },
        darkDecoy = {
            CoolDown = 35,
            StartCoolDown = 20,
            DefenseGain = 5,
            Spawns = {
                {Name = "Neuro Runner", Delay = 0.2, Amount = 5},
                {
                    Name = "Brain Bound",
                    Delay = 0.2,
                    Amount = 5,
                    Modifiers = {[Enum.Modifier.Bloated] = true},
                },
            },
        },
    },
}