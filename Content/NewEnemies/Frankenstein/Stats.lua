-- Script path: ReplicatedStorage.Content.NewEnemies.Frankenstein.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 1.75,
    MaxHealth = 2800,
    Reward = 3000,
    Defense = 35,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}