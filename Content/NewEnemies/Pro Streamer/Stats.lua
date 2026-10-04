-- Script path: ReplicatedStorage.Content.NewEnemies.Pro Streamer.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 6,
    MaxHealth = 1500,
    Reward = 1500,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}