-- Script path: ReplicatedStorage.Content.NewEnemies.Mandragora.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "It was wondered whether the plants of the Void had sentience, up until the Mandragora was found. It seems the flowers had completely overtaken a corpse as a host and bloomed. They do not speak or do much. When they move, they sound like rustling leaves. They will lie in a field with the Void Brutes to feel more connected to the Void, and to remember what it was like to be grass.",
    Scale = 1.5,
    Health = 7000,
    Speed = 2.85,
    HealthPerDifficulty = {Hard = 12000, Easy = 6500},
    Reward = {Hard = 3250, Easy = 3250},
    Attributes = {
        Enum.Modifier.HealthRegen,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}