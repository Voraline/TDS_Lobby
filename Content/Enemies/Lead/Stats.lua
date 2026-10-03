-- Script path: ReplicatedStorage.Content.Enemies.Lead.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 30,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Lead},
}