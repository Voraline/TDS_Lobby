-- Script path: ReplicatedStorage.Content.NewEnemies.Void Floater.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "To take care of a ‘Pod’ is to take care of a child. It needs to be nurtured from start to forever. Vast amounts of Void energy are crammed into these floating pods that are so proudly held overhead by the Void Floater. They are extremely passionate about taking care of it. Once the Pod is destroyed, it will fall to the ground and the Void Floater experiences something like agony, as it is the equivalent of losing their child.",
    Shield = 2250,
    Speed = 4,
    Health = 1500,
    ShieldBrokenSpeed = 0.675,
    ShieldPerDifficulty = {Hard = 1500, Easy = 2500, NilZone2 = 200},
    HealthPerDifficulty = {Hard = 1250, Easy = 750, NilZone2 = 200},
    Reward = {Hard = 500, Easy = 600, NilZone2 = 400},
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.StunImmune},
}