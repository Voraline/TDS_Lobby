-- Script path: ReplicatedStorage.Content.Enemies.Solar Servant.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 1.5,
    MaxHealth = 80000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}