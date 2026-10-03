-- Script path: ReplicatedStorage.Content.Enemies.Hidden.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 10,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}