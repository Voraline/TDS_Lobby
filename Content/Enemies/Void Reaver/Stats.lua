-- Script path: ReplicatedStorage.Content.Enemies.Void Reaver.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 0.6,
    MaxHealth = 1200000,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}