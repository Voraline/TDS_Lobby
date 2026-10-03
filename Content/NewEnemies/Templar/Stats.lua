-- Script path: ReplicatedStorage.Content.NewEnemies.Templar.Stats
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Warden",
    Scale = 1.25,
    Speed = 3,
    Health = 10000,
    RewardThreshold = 0.1,
    Defense = 40,
    AttackInterval = 10,
    AttackTime = 3.5,
    AttackRange = 20,
    HealthPerDifficulty = {PollutedWasteland = 67500, PVP_highRanks = 6000, Trial = 25000, Chapter1Mission7 = 5000},
    Reward = {Fallen = 10000, PollutedWasteland = 150000, Trial = 8000, Chapter1Mission7 = 20000},
    BeamInfo = {BeamDistance = 200, TowerStunRadius = 3, TowerStunDuration = 2, UnitDamage = 8},
    Percentage = {Towers = 10, Units = 90},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}