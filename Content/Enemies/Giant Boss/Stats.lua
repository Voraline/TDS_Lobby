-- Script path: ReplicatedStorage.Content.Enemies.Giant Boss.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 150,
    Speed = 1.35,
    MaxHealth = 2000,
    Defense = 40,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}