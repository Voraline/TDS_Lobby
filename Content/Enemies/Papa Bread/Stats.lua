-- Script path: ReplicatedStorage.Content.Enemies.Papa Bread.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    MaxHealth = 2400,
    Defense = 50,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}