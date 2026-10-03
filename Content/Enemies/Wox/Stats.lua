-- Script path: ReplicatedStorage.Content.Enemies.Wox.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 15000,
    Speed = 1.1,
    MaxHealth = 450000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}