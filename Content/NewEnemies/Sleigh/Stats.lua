-- Script path: ReplicatedStorage.Content.NewEnemies.Sleigh.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3,
    MaxHealth = 900,
    Reward = 300,
    Defense = 35,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}