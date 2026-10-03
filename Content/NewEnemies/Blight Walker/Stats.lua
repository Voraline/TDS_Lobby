-- Script path: ReplicatedStorage.Content.NewEnemies.Blight Walker.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6,
    MaxHealth = 1500,
    Reward = 2000,
    RewardThreshold = 0.5,
    SpitCooldown = 10,
    ExplosionRadius = 4,
    SpitRange = 18,
    BurstDelay = 0.67,
    ProjectileCount = 3,
    ProjectileVelocity = 25,
    FatigueDebuff = 20,
    FatigueDuration = 5,
    BuffLifetime = 0.1,
    BuffAmount = 15,
    HealthPerDifficulty = {Act2Easy = 750, Act2 = 1500, Act3Easy = 1000, Act3 = 1750},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    PuddleData = {LifeTime = 1, Cooldown = 1, Radius = 2},
}