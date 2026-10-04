-- Script path: ReplicatedStorage.Content.Enemies.Gunslinger.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 15000,
    Speed = 0.8,
    MaxHealth = 600000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}