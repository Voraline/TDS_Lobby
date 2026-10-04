-- Script path: ReplicatedStorage.Content.NewEnemies.Cat.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 5.5,
    MaxHealth = 50,
    Defense = 25,
    Reward = 100,
    HealthPerDifficulty = {PlsDonate = 65, PlsDonateHard = 100},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}