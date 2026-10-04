-- Script path: ReplicatedStorage.Content.Enemies.Frost Ravager.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 15000,
    Speed = 2,
    MaxHealth = 20000,
    ZombieType = "Frost",
    Defense = 50,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}