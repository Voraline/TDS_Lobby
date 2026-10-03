-- Script path: ReplicatedStorage.Content.NewEnemies.Unknown Small.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "There is not much to know about the Unknowns. Whether they are a lesser Unknown or a younger Unknown compared to the Unknown is still up for debate. What is known about them, though, is how they will violently implode upon death. It’s uncertain if even Void Caster knows much about them.",
    Scale = 1.1,
    Speed = 4,
    Health = 5500,
    UnitDamage = 20,
    Defense = 0,
    StunData = {Percent = -30, Radius = 15, Duration = 9},
    HealthPerDifficulty = {
        Act3 = 1500,
        Act3Easy = 250,
        NilZone = 5000,
        Hard = 9000,
        Easy = 6000,
    },
    Reward = {Hard = 2250, Easy = 2500},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}