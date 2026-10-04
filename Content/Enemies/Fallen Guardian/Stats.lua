-- Script path: ReplicatedStorage.Content.Enemies.Fallen Guardian.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    MaxHealth = 14000,
    Defense = 80,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}