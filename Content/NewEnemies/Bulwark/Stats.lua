-- Script path: ReplicatedStorage.Content.NewEnemies.Bulwark.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 6000,
    Speed = 2.25,
    RewardThreshold = 0.5,
    Reward = {Molten = 6000, SummerHard = 6000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}