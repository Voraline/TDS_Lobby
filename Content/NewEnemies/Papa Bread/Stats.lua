-- Script path: ReplicatedStorage.Content.NewEnemies.Papa Bread.Stats
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 2,
    MaxHealth = 2000,
    Reward = 4000,
    Archived = true,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}