-- Script path: ReplicatedStorage.Content.NewEnemies.Unknown Boss.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Price = 100,
    Speed = 3,
    MaxHealth = 15000,
    Defense = 0,
    UnitDamage = 75,
    Scale = 1.3,
    Description = "It’s unknown what the Unknown Boss is. What is known is that it is a cursed version of the Unknown, granted by the Void Caster — though the Void Caster herself does not know what the Unknown used to be known as, and whether the Unknown could be known is still, currently, unknown. The Elite Unknown chooses to scatter itself throughout the vastness of the Void and is usually found alone. There is not much to understand about it aside from its ability to create an internal supernova. It is taller than the Slow King and can, at random, create a smaller Unknown. Why? It’s unknown. What is known is that the Unknown Boss knows this, and would rather it stayed that way.",
    HealthPerDifficulty = {
        Act3 = 6000,
        Act3Easy = 1500,
        NilZone = 16500,
        NilZone2 = 16500,
        Hard = 32500,
        Easy = 27500,
    },
    Reward = {Hard = 12500, Easy = 13500, NilZone2 = 13500},
    StunData = {Percent = -60, Radius = 20, Duration = 4.5},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}