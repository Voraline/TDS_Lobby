-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Molten.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 1000,
    Speed = 4,
    Reward = 1400,
    Attributes = {Enum.Modifier.FireImmune, Enum.Modifier.FreezeImmune},
}