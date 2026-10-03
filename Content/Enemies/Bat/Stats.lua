-- Script path: ReplicatedStorage.Content.Enemies.Bat.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    MaxHealth = 100,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}