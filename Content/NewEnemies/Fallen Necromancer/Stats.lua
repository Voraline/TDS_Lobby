-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Necromancer.Stats
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    MaxHealth = 2800,
    Speed = 2,
    RewardThreshold = 0.33,
    Description = "Fallen Necromancers were priests who used to tend to the dead, ensuring peaceful passage to the afterlife. When the Queen's sacrifice destroyed the boundary between life and death, they gained the power to raise the fallen. The curse allowed them to cast dark rituals that bind souls to corpses. Now, they are protected by the very dead they once laid to rest.",
    HealthPerDifficulty = {Insane = 1500, Fallen = 3000, PVP_highRanks = 1350, SummerExperimental = 2800},
    Reward = {Insane = 2000, Fallen = 3000, PVP_highRanks = 2000, SummerExperimental = 1400},
    Attacks = {
        Summon = {Amount = 8, Delay = 0.3, Cooldown = 10, Spawns = {{Name = "Fallen Skeleton", Weight = 100}}},
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}