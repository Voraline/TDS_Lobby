-- Script path: ReplicatedStorage.Content.Enemies.Frost Tank.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4,
    MaxHealth = 8000,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}