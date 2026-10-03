-- Script path: ReplicatedStorage.Content.Enemies.Balloon.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 10,
    Speed = 5,
    MaxHealth = 15,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}