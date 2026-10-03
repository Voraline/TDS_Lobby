-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Executioner.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2,
    Health = 27500,
    Reward = 30000,
    RewardThreshold = 0.025,
    CheckDelay = 1,
    StunDuration = 8,
    AttackCooldown = 5,
    Range = 6,
    HealthPerDifficulty = {SummerMedium = 20000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}