-- Script path: ReplicatedStorage.Content.NewEnemies.Polluted Hazmat.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Hazardous",
    MaxHealth = 200,
    Defense = 50,
    Speed = 4.5,
    Reward = 250,
    Archived = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}