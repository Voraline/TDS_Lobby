-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Hazmat.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 400,
    Reward = 350,
    Defense = 60,
    Attributes = {
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.StunImmune,
    },
}