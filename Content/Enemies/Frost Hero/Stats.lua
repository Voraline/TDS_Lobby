-- Script path: ReplicatedStorage.Content.Enemies.Frost Hero.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    ZombieType = "Frost",
    Speed = 1.5,
    MaxHealth = 80000,
    Archived = true,
    Removed = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}