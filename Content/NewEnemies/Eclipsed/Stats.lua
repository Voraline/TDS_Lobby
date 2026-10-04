-- Script path: ReplicatedStorage.Content.NewEnemies.Eclipsed.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    MaxHealth = 3500,
    Defense = 60,
    RewardThreshold = 0.25,
    HealthPerDifficulty = {Act3 = 8000, Act3Easy = 4000, NilZone = 2500},
    Reward = {Act3 = 6000, Act3Easy = 6000, NilZone = 5000},
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.ExplosionImmune,
        Enum.Modifier.MoltenCorpse,
    },
}