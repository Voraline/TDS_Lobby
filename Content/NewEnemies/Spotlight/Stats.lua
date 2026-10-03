-- Script path: ReplicatedStorage.Content.NewEnemies.Spotlight.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    Health = 2000,
    RewardThreshold = 0.25,
    HealthRegen = 40,
    HealthRegenRate = 0.2,
    Range = 15,
    SpotlightRadius = 15,
    Description = "The Spotlight is a flying enemy with a large spotlight for a head that illuminates Narrator's stage. The Spotlight has the ability to heal other enemies, making it a priority target. Sometimes, the Painter Men will stand beneath it to paint on their canvas faces.",
    HealthPerDifficulty = {Hard = 2500, Easy = 1000},
    Reward = {Hard = 4500, Easy = 3500},
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.StunImmune},
}