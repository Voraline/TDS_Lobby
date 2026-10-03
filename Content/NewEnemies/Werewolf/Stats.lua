-- Script path: ReplicatedStorage.Content.NewEnemies.Werewolf.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.6,
    MaxHealth = 6000,
    Reward = 6000,
    Defense = 15,
    RewardThreshold = 0.5,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}