-- Script path: ReplicatedStorage.Content.NewEnemies.Monkey.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2.5,
    Defense = 50,
    MaxHealth = 800,
    Reward = 1000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Aggro},
}