-- Script path: ReplicatedStorage.Content.Enemies.Fallen Titan.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 1000,
    Speed = 2.5,
    MaxHealth = 6000,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}