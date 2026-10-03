-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Demon.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 160,
    Speed = 5.25,
    Scale = 1.2,
    Reward = {Molten = 175},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}