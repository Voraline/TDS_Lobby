-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Giant.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 4000,
    Speed = 2,
    Defense = 0,
    RewardThreshold = 0.25,
    Scale = 1.2,
    Description = "Fallen Giants were the kingdom's most honored guardians. They stood watch over the throne room, where they witnessed the Queen's sacrifice. They are vessels of magic lacking free will, and the curse only magnified their power. Massive in size, they make for great defenders and one could tell a Giant was coming by the shaking of the ground upon each step.",
    HealthPerDifficulty = {Fallen = 4000, PVP_highRanks = 2500, SummerExperimental = 4000},
    Reward = {Fallen = 4800, PVP_highRanks = 4000, SummerExperimental = 2000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}