-- Script path: ReplicatedStorage.Content.Enemies.Frost Invader.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    ZombieType = "Frost",
    Speed = 4,
    MaxHealth = 3000,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}