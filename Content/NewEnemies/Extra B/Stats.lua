-- Script path: ReplicatedStorage.Content.NewEnemies.Extra B.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 100,
    Description = "The Extras are positioned throughout theater productions, serving as background characters in scenes and sometimes disguising themselves as objects to help move set pieces during transitions. They are typically assigned boring tasks that the Builder doesn't want to do, though their suffering is hidden beneath tear-painted masks.",
    HealthPerDifficulty = {Easy = 60, Hard = 100},
    Reward = {Easy = 200, Hard = 250},
    Attributes = {},
}