-- Script path: ReplicatedStorage.Content.NewEnemies.Conjurer.Stats
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 8000,
    Speed = 1.5,
    Reward = 20000,
    RewardThreshold = 0.25,
    HiddenModePerc = 0.5,
    Defense = 50,
    HealthPerDifficulty = {
        Act2Easy = 4000,
        Act2 = 7000,
        Act3Easy = 5000,
        Act3 = 10000,
        Badlands = 15000,
    },
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
    Attacks = {
        Summon = {
            Amount = 6,
            Delay = 0.5,
            Cooldown = 35,
            Spawns = {{Name = "Giant Skeleton", Weight = 60}, {Name = "Necromancer", Weight = 40}},
        },
    },
}