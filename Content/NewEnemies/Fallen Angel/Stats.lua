-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Angel.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3,
    Health = 5000,
    Defense = 0,
    Reward = 5000,
    Description = "Fallen Angels were the kingdom's most devoted followers, blessed by Two X himself for their unwavering faith. They served as spiritual guardians, their presence bringing comfort to all who saw them. However, the Queen's sacrifice corrupted their blessings and tarnished their purity. As the curse consumed them, it became a symbol that their kingdom truly died.",
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.HealthRegen},
}