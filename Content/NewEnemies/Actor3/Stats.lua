-- Script path: ReplicatedStorage.Content.NewEnemies.Actor3.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 17000,
    Reward = 12500,
    Defense = 0,
    Description = "This actor dreamt of passing through a portal into a theater where an illuminated cube waited at its center. They could have sworn an impressive battle had taken place, but the closer they got to the memory, the more it faded away. Eventually, their daydream snapped to reality—sitting on a Ferris Wheel, overlooking the wooden bridges. ",
    HealthPerDifficulty = {Easy = 1875, Hard = 5000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}