-- Script path: ReplicatedStorage.Content.NewEnemies.Hex's Maw.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 20000,
    Damage = 150,
    StunTime = 3.5,
    AttackCD = 10,
    SwingFOV = 160,
    HitRadius = 8,
    Reward = 20000,
    RewardThreshold = 0.1,
    Speed = 2.3,
    Defense = 50,
    HealthPerDifficulty = {Act2Easy = 15000, Act2 = 27500, Act3Easy = 17500, Act3 = 30000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}