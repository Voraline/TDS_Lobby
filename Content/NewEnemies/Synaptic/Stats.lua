-- Script path: ReplicatedStorage.Content.NewEnemies.Synaptic.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6.5,
    MaxHealth = 1200,
    Reward = 1750,
    RewardThreshold = 0.5,
    Defense = 50,
    BuffLifetime = 0.1,
    BuffAmount = 10,
    HealthPerDifficulty = {Act1Easy = 750, Act1 = 1200},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    PuddleData = {LifeTime = 1, Cooldown = 1, Radius = 2},
}