-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Accelerator.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Accelerator",
    Description = "Accelerator watched the creature raise a version of his own particle accelerator, the device hummed loudly. In a flash of purple light, it fired — and suddenly Accelerator found himself standing where Engineer had been. Accelerator's mind couldn't understand. How did the Nil Zone copy something this complex, then change it?",
    Speed = 3.25,
    Scale = 2,
    Health = 135000,
    RewardThreshold = 0.25,
    Defense = 60,
    AttackRecharge = 10,
    StunTime = 6,
    Range = 10,
    TowerSwappingRange = 25,
    HealthPerDifficulty = {Act3 = 135000, Act3Easy = 35000, NilZone2 = 30000},
    Reward = {Act3 = 50000, Act3Easy = 30000, NilZone2 = 30000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}