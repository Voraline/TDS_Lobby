-- Script path: ReplicatedStorage.Content.Enemies.Circuit.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 0,
    Speed = 8,
    MaxHealth = 2500,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}