-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Mystery.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Scale = 1.4,
    Speed = 4.5,
    Health = 2000,
    HealthPerDifficulty = {Hard = 4500, Easy = 2000, NilZone2 = 600},
    Reward = {Hard = 1500, Easy = 900, NilZone2 = 600},
    Attributes = {Enum.Modifier.StunImmune},
    Amount = NumberRange.new(1, 1),
    SpawnData = {
        chances = {common = 20, uncommon = 30, rare = 15},
        spawns = {common = {"Void Floater"}, uncommon = {"Void Reaper", "Voidling"}, rare = {"Elite Phantom"}},
        Attributes = {Enum.Modifier.StunImmune},
    },
}