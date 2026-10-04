-- Script path: ReplicatedStorage.Content.Enemies.Golden.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 200,
    Archived = true,
    Removed = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.ExplosionImmune,
    },
}