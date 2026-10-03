-- Script path: ReplicatedStorage.Content.NewEnemies.Referee.Stats
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "",
    Speed = 1.5,
    Health = 4000,
    Defense = 0,
    Scale = 2,
    RewardThreshold = 0.1,
    AttackDelay = 2.1,
    AttackRecharge = 10,
    Range = 6,
    Angle = 60,
    FireRange = 20,
    ScaredDebuff = 15,
    ScaredDuration = 6,
    CooldownDebuff = -30,
    CooldownDuration = 6,
    UnitDamage = 1000,
    HealthPerDifficulty = {
        Map1AdidasEasy = 4000,
        Map1AdidasHard = 10000,
        Map2AdidasEasy = 3600,
        Map2AdidasHard = 5000,
        Map3AdidasEasy = 3600,
        Map3AdidasHard = 5000,
    },
    HealthPerGamemode = {
        Map1Adidas = {Easy = 4000, Hard = 10000},
        Map2Adidas = {Easy = 3600, Hard = 5000},
        Map3Adidas = {Easy = 3600, Hard = 5000},
    },
    ShieldPerDifficulty = {Act1 = 1500, Act3 = 1500, Act3Easy = 750},
    Reward = {
        Map1AdidasEasy = 18750,
        Map1AdidasHard = 50000,
        Map2AdidasEasy = 4000,
        Map2AdidasHard = 6250,
        Map3AdidasEasy = 4000,
        Map3AdidasHard = 6250,
    },
    RewardPerGamemode = {
        Map1Adidas = {Easy = 18750, Hard = 70000},
        Map2Adidas = {Easy = 4000, Hard = 6250},
        Map3Adidas = {Easy = 4000, Hard = 6250},
    },
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.FreezeImmune,
    },
}