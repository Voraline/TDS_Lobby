-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Fallen.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 7.5,
    Health = 800,
    Description = "Corrupted Fallen were both the King's and Queen's personal servants. They stood closest to her during the sacrifice and witnessed her final moments. The corruption crawls across their bodies, slowly consuming them as time moves on. It doesn't seem that they are bothered by this, but regular Fallen tend to stay away from them.",
    HealthPerDifficulty = {Fallen = 1200, PVP_highRanks = 800, SummerExperimental = 800},
    Reward = {Insane = 1350, Fallen = 1200, PVP_highRanks = 750, SummerExperimental = 400},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}