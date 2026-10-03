-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Spawner.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 10,
    MaxHealth = 0,
    Reward = 0,
    Description = "The Frost Spawner used in Outpost 32 to take down the Outpost's defenses. How did you get this anyways?!?",
    PathPoints = {ApcPath1 = {}, ApcPath2 = {}, ApcPath3 = {}, ApcPath4 = {}},
    Attributes = {
        Enum.Modifier.Ignore,
        Enum.Modifier.God,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.StunImmune,
    },
}