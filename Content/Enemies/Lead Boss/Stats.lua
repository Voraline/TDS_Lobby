-- Script path: ReplicatedStorage.Content.Enemies.Lead Boss.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2,
    MaxHealth = 180,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Lead},
}