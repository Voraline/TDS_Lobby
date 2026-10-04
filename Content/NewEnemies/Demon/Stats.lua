-- Script path: ReplicatedStorage.Content.NewEnemies.Demon.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    MaxHealth = 6500,
    Reward = 4500,
    Defense = 0,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FireImmune},
}