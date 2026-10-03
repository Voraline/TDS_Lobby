-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Shield.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 12500,
    Shield = 5000,
    Speed = 1.5,
    DashSpeed = 6,
    RewardThreshold = 0.25,
    Defense = 50,
    DashTime = 4,
    Description = "Fallen Shields were trained to absorb incoming attacks while protecting their allies. They stood before the throne as the final defense to invaders. The curse tarnished them as all fell under control of the Fallen King. They protect nothing now but the one who once had everything.",
    HealthPerDifficulty = {Fallen = 15000, PVP_highRanks = 8000, SummerExperimental = 8000},
    Reward = {Insane = 12000, Fallen = 15000, PVP_highRanks = 12000, SummerExperimental = 6000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}