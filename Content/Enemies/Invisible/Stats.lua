-- Script path: ReplicatedStorage.Content.Enemies.Invisible.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 22,
    IsHardcore = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}