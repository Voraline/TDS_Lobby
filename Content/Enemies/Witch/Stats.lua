-- Script path: ReplicatedStorage.Content.Enemies.Witch.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 140,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}