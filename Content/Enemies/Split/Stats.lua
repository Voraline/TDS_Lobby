-- Script path: ReplicatedStorage.Content.Enemies.Split.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Price = 1000,
    Speed = 6,
    MaxHealth = 1000,
    HealthScale = 50,
    Archived = true,
    Removed = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}