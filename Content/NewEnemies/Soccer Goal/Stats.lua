-- Script path: ReplicatedStorage.Content.NewEnemies.Soccer Goal.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 10000,
    Speed = 1.75,
    RewardThreshold = 0.1,
    Description = "",
    HealthPerDifficulty = {Map2AdidasEasy = 10000, Map2AdidasHard = 20000, Map3AdidasEasy = 4000, Map3AdidasHard = 6000},
    HealthPerGamemode = {Map2Adidas = {Easy = 10000, Hard = 20000}, Map3Adidas = {Easy = 4000, Hard = 6000}},
    Reward = {Map2AdidasEasy = 40000, Map2AdidasHard = 37500, Map3AdidasEasy = 3750, Map3AdidasHard = 5625},
    RewardPerGamemode = {Map2Adidas = {Easy = 40000, Hard = 37500}, Map3Adidas = {Easy = 3750, Hard = 5625}},
    Attacks = {Summon = {Amount = 8, Delay = 0.3, Cooldown = 10, Spawns = {{Name = "Soccer Head", Weight = 100}}}},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}