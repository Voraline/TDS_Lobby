-- Script path: ReplicatedStorage.Content.Enemies.Circuit2.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 0,
    Speed = 5,
    MaxHealth = 1800,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}