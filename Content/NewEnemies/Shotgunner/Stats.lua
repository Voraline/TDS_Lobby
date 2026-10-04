-- Script path: ReplicatedStorage.Content.NewEnemies.Shotgunner.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.1,
    MaxHealth = 2250,
    Reward = 3000,
    RewardThreshold = 0.5,
    Defense = 30,
    Archived = true,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}