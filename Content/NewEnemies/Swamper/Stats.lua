-- Script path: ReplicatedStorage.Content.NewEnemies.Swamper.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 500,
    Reward = 700,
    Defense = 25,
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}