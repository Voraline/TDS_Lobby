-- Script path: ReplicatedStorage.Content.NewEnemies.Cursed Horror.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 1000,
    Reward = 450,
    Defense = 50,
    UnitDamage = 100,
    StunTime = 0,
    StunRadius = 0,
    HealthPerDifficulty = {Act3Easy = 300, Act3 = 700, Badlands = 250},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.Flying},
}