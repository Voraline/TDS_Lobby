-- Script path: ReplicatedStorage.Content.NewEnemies.Extra A.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5,
    MaxHealth = 30,
    Description = "The Extras are positioned throughout theater productions, serving as background characters in scenes and sometimes disguising themselves as objects to help move set pieces during transitions. They are typically assigned boring tasks that the Builder doesn't want to do, though their suffering is hidden beneath tear-painted masks.",
    HealthPerDifficulty = {Easy = 15, Hard = 25},
    Reward = {Easy = 50, Hard = 65},
    Attributes = {},
}