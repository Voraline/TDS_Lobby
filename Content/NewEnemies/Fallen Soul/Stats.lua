-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Soul.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    Defense = 20,
    MaxHealth = 75,
    Description = "Fallen Souls were the spirits of those who died before the curse took hold. The Queen's sacrifice broke down the wall between life and death, pulling these souls back into the now-corrupted realm. They drift through battlefields, unable to rest or return to the kingdom they once knew. They are nearly invisible — most people only feel a cold breeze as they pass by.",
    HealthPerDifficulty = {Fallen = 150, PVP_highRanks = 60},
    Reward = {Fallen = 180, PVP_highRanks = 100},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}