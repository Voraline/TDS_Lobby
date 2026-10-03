-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Hero.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    MaxHealth = 3500,
    Defense = 30,
    RewardThreshold = 0.5,
    Scale = 1.05,
    Description = "Fallen Heroes were soon-to-be Champions who answered the King's call to find a new source of magic. Though they returned empty-handed, they were the most promising warriors in the army and in line to become the next Champions. The curse bound them to eternal service for the King, transforming them much like the Fallen into mindless soldiers. They are now living embodiments of lost potential, forever denied the glory they were close to achieving.",
    HealthPerDifficulty = {PVP_highRanks = 2250},
    Reward = {Fallen = 5000, PVP_highRanks = 3000, SummerExperimental = 1500},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}