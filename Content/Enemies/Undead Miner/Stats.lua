-- Script path: ReplicatedStorage.Content.Enemies.Undead Miner.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3.5,
    MaxHealth = 5000,
    Defense = 20,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}