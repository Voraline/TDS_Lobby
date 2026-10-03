-- Script path: ReplicatedStorage.Content.Enemies.Fallen Hero.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3.5,
    MaxHealth = 5000,
    Defense = 50,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}