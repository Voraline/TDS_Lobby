-- Script path: ReplicatedStorage.Content.NewEnemies.TutorialBoss.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.25,
    MaxHealth = 1250,
    Reward = 0,
    Removed = true,
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}