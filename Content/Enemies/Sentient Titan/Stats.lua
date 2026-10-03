-- Script path: ReplicatedStorage.Content.Enemies.Sentient Titan.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2,
    MaxHealth = 4000,
    NoSpecial = true,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}