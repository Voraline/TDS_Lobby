-- Script path: ReplicatedStorage.Content.Enemies.Deep Freeze.Stats
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    ZombieType = "Frost",
    Speed = 2,
    MaxHealth = 5000,
    Defense = 50,
    Archived = true,
    Removed = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}