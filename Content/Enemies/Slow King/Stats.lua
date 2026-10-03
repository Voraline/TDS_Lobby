-- Script path: ReplicatedStorage.Content.Enemies.Slow King.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 3000,
    Speed = 2.5,
    MaxHealth = 5000,
    Defense = 80,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}