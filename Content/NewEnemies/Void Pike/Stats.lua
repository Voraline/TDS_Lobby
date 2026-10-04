-- Script path: ReplicatedStorage.Content.NewEnemies.Void Pike.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Void Pikes acted as the transporters that drove the army. They would gather supplies, help move weapons, and work on general tasks. They sprint from one place to another without ever seeming to tire, and they never complain. It seems they know every route, including places they have never been to. You can always tell a Void Pike apart by the armor they wear.",
    Scale = 1.3,
    Speed = 5,
    Health = 2500,
    HealthPerDifficulty = {Hard = 2000, Easy = 1750},
    Reward = {Hard = 500, Easy = 800},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.Lead},
}