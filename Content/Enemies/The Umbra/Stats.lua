-- Script path: ReplicatedStorage.Content.Enemies.The Umbra.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 1,
    MaxHealth = 1000000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}