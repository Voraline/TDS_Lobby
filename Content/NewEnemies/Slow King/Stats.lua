-- Script path: ReplicatedStorage.Content.NewEnemies.Slow King.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Where a realm falls, its king is not always quick enough to fall with it. The Slow King sat in the ruins of their realm after trying to save their people. As the Void bloomed across the landscape and everything they had built came crumbling down, the Slow King was the last to accept defeat. It was not until they were recognized by Void Caster that they could continue on beside their people, who were now Souls for the Void.",
    Shield = 6000,
    Speed = 2.85,
    Health = 10000,
    Defense = 60,
    DefenseNoShield = 0,
    Scale = 1,
    ShieldPerDifficulty = {Hard = 7000, Easy = 6000},
    HealthPerDifficulty = {Hard = 14000, Easy = 12000},
    Reward = {Hard = 5000, Easy = 6000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}