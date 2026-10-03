-- Script path: ReplicatedStorage.Content.NewEnemies.Blighted.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    Defense = 0,
    Health = 4000,
    Scale = 1.1,
    HealthPerDifficulty = {Hard = 5000, Easy = 4500, NilZone2 = 500},
    Reward = {Hard = 1200, Easy = 2000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}