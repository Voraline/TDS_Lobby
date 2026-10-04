-- Script path: ReplicatedStorage.Content.NewEnemies.Balloon Kid.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 4,
    MaxHealth = 500,
    Shield = 750,
    Reward = 1500,
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.FreezeImmune},
}