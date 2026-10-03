-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Guardian.Stats
-- Decompile time: 0.30 ms

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
    Description = "Fallen Guardians stood watch at the front of the castle, the first line of defense against any who would threaten their kingdom. All who entered honored them, and on the battlefield they were the most feared warriors.",
    HealthPerDifficulty = {PVP_highRanks = 20000, SummerExperimental = 20000},
    Reward = {Fallen = 45000, PVP_highRanks = 20000, SummerExperimental = 10000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}