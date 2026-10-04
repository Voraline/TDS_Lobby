-- Script path: ReplicatedStorage.Content.NewEnemies.Gravestone.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Gravestone was carefully created by the Grave Digger. After his mutation, he spent days carving thousands of these stone heads. The Necromancers discovered how to enchant them, binding their magic to each stone so that the dead would rise wherever one is placed.",
    Speed = 0,
    Health = 300,
    Defense = 130,
    HealthPerDifficulty = {Act3 = 404},
    ShieldPerDifficulty = {Act3 = 3000},
    Reward = {Act1 = 200},
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.Aggro,
    },
}