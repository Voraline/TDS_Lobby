-- Script path: ReplicatedStorage.Content.NewEnemies.Toilet Boss.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 0.75,
    MaxHealth = 150000,
    Reward = 700000,
    RewardThreshold = 0.05,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    ControllerStats = {
        laserRange = 22,
        laserAngle = 60,
        laserRadius = 10,
        laserDamage = 10,
        barrageLength = 5,
        laserCount = 4,
        spawnPeriod = 4,
        spawnOffset = 3,
        spawnCount = 20,
    },
}