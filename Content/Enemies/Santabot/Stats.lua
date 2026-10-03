-- Script path: ReplicatedStorage.Content.Enemies.Santabot.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    HealthScale = 15000,
    Speed = 3,
    MaxHealth = 200000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
}