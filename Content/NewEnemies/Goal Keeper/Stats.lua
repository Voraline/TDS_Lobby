-- Script path: ReplicatedStorage.Content.NewEnemies.Goal Keeper.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 45000,
    Speed = 2,
    Damage = 150,
    StunTime = 3,
    AttackCD = 10,
    SwingFOV = 160,
    HitRadius = 8,
    RewardThreshold = 0.25,
    Defense = 30,
    Scale = 1.2,
    Description = "",
    HealthPerDifficulty = {Map3AdidasEasy = 10000, Map3AdidasHard = 20000},
    Reward = {Map3AdidasEasy = 5625, Map3AdidasHard = 11250},
    HealthPerGamemode = {Map3Adidas = {Easy = 10000, Hard = 20000}},
    RewardPerGamemode = {Map3Adidas = {Easy = 5625, Hard = 11250}},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}