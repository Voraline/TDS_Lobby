-- Script path: ReplicatedStorage.Content.Enemies.Molten.Stats
-- Decompile time: 0.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 100,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FireImmune},
}