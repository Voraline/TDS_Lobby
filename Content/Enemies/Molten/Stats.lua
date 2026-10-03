-- Script path: ReplicatedStorage.Content.Enemies.Molten.Stats
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 100,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FireImmune},
}