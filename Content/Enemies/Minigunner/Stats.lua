-- Script path: ReplicatedStorage.Content.Enemies.Minigunner.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    MaxHealth = 30000,
    Defense = 30,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}