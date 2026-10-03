-- Script path: ReplicatedStorage.Content.NewEnemies.Actor2.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    MaxHealth = 8000,
    Reward = 7500,
    Defense = 60,
    Description = "Without all three actors, the production would have been impossible, yet this one delivered a particularly stunning performance. They led the others toward their master's ultimate goal, a plan set in motion from day one. Although, they couldn’t shake a horrifying sensation. The feeling that someone could effortlessly erase them.",
    HealthPerDifficulty = {Easy = 1125, Hard = 3000, NilZone2 = 6000},
    Attributes = {Enum.Modifier.ExplosionImmune, Enum.Modifier.StunImmune},
}