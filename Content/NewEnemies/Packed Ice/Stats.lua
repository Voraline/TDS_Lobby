-- Script path: ReplicatedStorage.Content.NewEnemies.Packed Ice.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3.25,
    Health = 1500,
    RewardThreshold = 0.5,
    Scale = 1.45,
    Defense = 50,
    Archived = true,
    Description = "Packed Ice is a specialized foot soldier of the Frost Army. During their creation, their core beliefs are embedded within their body, marked by an exposed heart. Their motto is simple: become the best defender, for survival depends on it.",
    HealthPerDifficulty = {Easy = 100, Hard = 250, Frost = 1500},
    Reward = {Easy = 200, Hard = 400, Frost = 1125},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}