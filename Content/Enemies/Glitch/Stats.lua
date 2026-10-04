-- Script path: ReplicatedStorage.Content.Enemies.Glitch.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 5,
    Speed = 12,
    MaxHealth = 200,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}