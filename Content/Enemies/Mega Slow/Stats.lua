-- Script path: ReplicatedStorage.Content.Enemies.Mega Slow.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 150,
    Speed = 2,
    MaxHealth = 1600,
    Defense = 15,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}