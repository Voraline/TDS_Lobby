-- Script path: ReplicatedStorage.Content.NewEnemies.Extra C.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5,
    MaxHealth = 100,
    Scale = 1.2,
    Defense = 0,
    Description = "The Extras are positioned throughout theater productions, serving as background characters in scenes and sometimes disguising themselves as objects to help move set pieces during transitions. They are typically assigned boring tasks that the Builder doesn't want to do, though their suffering is hidden beneath tear-painted masks.",
    HealthPerDifficulty = {Easy = 250, Hard = 400},
    Reward = {Easy = 360, Hard = 480},
    Attributes = {},
}