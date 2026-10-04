-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Blight Walker.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6.5,
    MaxHealth = 1250,
    Reward = 1000,
    Defense = 20,
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
    PuddleData = {LifeTime = 1, Cooldown = 1, Radius = 2},
    Attributes = {},
}