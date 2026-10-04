-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Horror.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 800,
    Reward = 1000,
    Defense = 20,
    UnitDamage = 100,
    StunTime = 0,
    StunRadius = 0,
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.StunImmune},
}