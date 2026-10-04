-- Script path: ReplicatedStorage.Content.Enemies.Error.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 400,
    Speed = 10,
    MaxHealth = 500,
    HealthScale = 20,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}