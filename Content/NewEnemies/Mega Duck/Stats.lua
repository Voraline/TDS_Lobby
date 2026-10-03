-- Script path: ReplicatedStorage.Content.NewEnemies.Mega Duck.Stats
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Mega Ducky",
    Description = "Mega Ducky is the top of his class and the General Duck that leads the others into battle.  He is stylish, authoritative, and commanding. His presence demands respect from every duck in the force, and his strategic brilliance has led to countless crumb-filled victories. When Mega Ducky speaks, even the most seasoned soldiers know to listen.",
    Health = 15000,
    Speed = 2.25,
    Defense = 0,
    RewardThreshold = 0.1,
    HealthPerDifficulty = {Hard = 10000, Easy = 5000},
    Reward = {Hard = 12500, Easy = 12500},
    Spawns = {["Elite Ducky"] = {amount = 5, modifiers = {}, stats = {}}},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}