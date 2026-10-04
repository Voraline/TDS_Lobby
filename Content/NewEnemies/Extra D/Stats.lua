-- Script path: ReplicatedStorage.Content.NewEnemies.Extra D.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4.5,
    MaxHealth = 300,
    Scale = 1.5,
    Description = "The Extras are positioned throughout theater productions, serving as background characters in scenes and sometimes disguising themselves as objects to help move set pieces during transitions. They are typically assigned boring tasks that the Builder doesn't want to do, though their suffering is hidden beneath tear-painted masks.",
    HealthPerDifficulty = {Easy = 1000, Hard = 1600},
    Reward = {Easy = 1600, Hard = 1920},
    Attributes = {},
}