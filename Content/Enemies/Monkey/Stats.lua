-- Script path: ReplicatedStorage.Content.Enemies.Monkey.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    Defense = 50,
    MaxHealth = 800,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Aggro},
}