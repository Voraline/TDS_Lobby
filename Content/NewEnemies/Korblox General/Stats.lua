-- Script path: ReplicatedStorage.Content.NewEnemies.Korblox General.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.5,
    MaxHealth = 6,
    RewardThreshold = 0.25,
    Description = "From the Ice Heart tribe, the Korblox General is among the most powerful units in The Korblox Empire. Admired for their ferocity and strength, these generals could singlehandedly destroy a small army. The low-ranking members of the empire kneel before them as the screams of their enemies echo from their bodies.",
    HealthPerDifficulty = {Easy = 4000, Mega = 6000, Impossible = 8500, Fallen = 2250},
    Reward = {Easy = 4500, Mega = 8000, Impossible = 8000, Fallen = 5},
    Attributes = {},
}