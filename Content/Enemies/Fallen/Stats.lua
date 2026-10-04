-- Script path: ReplicatedStorage.Content.Enemies.Fallen.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 7,
    MaxHealth = 180,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}