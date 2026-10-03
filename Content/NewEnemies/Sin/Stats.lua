-- Script path: ReplicatedStorage.Content.NewEnemies.Sin.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 400,
    Reward = 350,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FireImmune},
}