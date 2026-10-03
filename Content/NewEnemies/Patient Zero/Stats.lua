-- Script path: ReplicatedStorage.Content.NewEnemies.Patient Zero.Stats
-- Decompile time: 1.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local v1 = GameState.Difficulty == "Casual"
return {
    Speed = 1,
    MaxHealth = 100000,
    HealthRegenRate = 1.5,
    HealthRegenAmount = 5,
    HealRadius = 10,
    RewardThreshold = 0.025,
    HealthScale = 1000,
    Defense = 20,
    HealthPerDifficulty = {Casual = 60000, Intermediate = 100000, PVP_midRanks = 50000, SummerMedium = 25000},
    Reward = {Casual = 200000, Intermediate = 160000, SummerMedium = 80000},
    AttackInfo = {
        Flask = {CoolDown = 30, StudsAhead = 6, ProjectileData = {dtMultiplier = 6, Gravity = -1, Velocity = 2}},
        EnemySpawn = {
            CoolDown = 45,
            Amount = 5,
            Data = {
                Casual = {
                    {Name = "Hazmats", Percent = 20},
                    {Name = "Normal Boss", Percent = 50},
                    {Name = "Enraged", Percent = 30},
                },
                Intermediate = {
                    {Name = "Living Experiment", Percent = 100},
                    {Name = "Boomer", Percent = 100},
                    {Name = "Ghoul", Percent = 100},
                    {Name = "Speedy Boss", Percent = 100},
                },
            },
        },
        Stomp = {CoolDown = 55, StunRadius = 30, UnitDamage = 400, StunDelay = {min = 5, max = 5}},
        Toxic = {
            CoolDown = 45,
            StunRadius = 5,
            CheckRange = 28,
            UnitDamage = 500,
            Amount = 4,
            StunDelay = {min = 10, max = 10},
            ProjectileData = {dtMultiplier = 5, Gravity = -2, Velocity = 4},
        },
    },
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.StunImmune,
        not v1 and Enum.Modifier.FreezeImmune or nil,
        not v1 and Enum.Modifier.FireImmune or nil,
    },
}