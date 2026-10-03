-- Script path: ReplicatedStorage.Content.Enemies.Charge.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 8,
    MaxHealth = 160,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}