-- Script path: ReplicatedStorage.Content.Enemies.Sleigh.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 150,
    Defense = 35,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}