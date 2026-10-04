-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Packed Ice.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 3.5,
    MaxHealth = 250,
    Reward = 400,
    DisplayName = "Packed Ice",
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}