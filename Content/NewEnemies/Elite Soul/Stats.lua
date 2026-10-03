-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Soul.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Elite Souls are regular Souls of those who died from either having their realm destroyed by the Void or by succumbing to the eternal nothing. Elite Souls are created from the regular souls having found enlightenment. Basically, a higher purpose for their recreation as a servant to the Void Caster. For their loyalty, she will grant them the unique gift of wings. Sometimes, the Elite Souls will flutter their wings as a sign of joy. If there is a group of them, they then just sound like a group of angry pigeons.",
    Speed = 4,
    MaxHealth = 10000,
    Scale = 1.4,
    HealthPerDifficulty = {Hard = 25000, Easy = 20000},
    Reward = {Hard = 8000, Easy = 12500},
    Attributes = {
        Enum.Modifier.Hidden,
        Enum.Modifier.Ghost,
        Enum.Modifier.StunImmune,
    },
}