-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Hunter.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 8500,
    Speed = 5,
    RewardThreshold = 0.2,
    Scale = 1.65,
    Defense = 25,
    StunTime = 5,
    UnitDamage = 900,
    HoldTime = 1.75,
    AttackDebounce = 8,
    Range = 35,
    MinRange = 10,
    FreezeTime = 10,
    Description = "Frost Hunters are some of the most ferocious units in the Frost Spirit’s army. Talented spear throwers, they ruthlessly hunt down their targets, strategizing in groups to corner them before making their move. The sharp spikes on their shoulder pad are used to charge their enemies in battle. They throw javelins at towers and units.",
    HealthPerDifficulty = {Easy = 300, Hard = 750, Frost = 10000},
    Reward = {Easy = 300, Hard = 750, Frost = 7500},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
    ProjectileData = {gravity = -1, velocity = 0.1, dtMultiplier = 6},
}