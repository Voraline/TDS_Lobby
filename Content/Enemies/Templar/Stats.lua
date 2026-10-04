-- Script path: ReplicatedStorage.Content.Enemies.Templar.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 2000,
    HealthScale = 250,
    Speed = 2.5,
    MaxHealth = 6000,
    Defense = 40,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}