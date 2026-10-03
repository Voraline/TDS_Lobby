-- Script path: ReplicatedStorage.Content.Enemies.Flare.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 800,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FireImmune},
}