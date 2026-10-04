-- Script path: ReplicatedStorage.Content.NewEnemies.Hand Boss.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.5,
    MaxHealth = 300000,
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.StunImmune,
        Enum.Modifier.Ignore,
    },
}