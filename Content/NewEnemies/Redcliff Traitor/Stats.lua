-- Script path: ReplicatedStorage.Content.NewEnemies.Redcliff Traitor.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    Reward = 2500,
    RewardThreshold = 0.2,
    MaxHealth = 6,
    Description = "The Redcliff Traitor comprises both high ranking Korblox and Redcliff warriors. Forcibly merged by a powerful entity, there may be greater threats lurking in the shadows—dangers that both empires have yet to notice.",
    HealthPerDifficulty = {Easy = 1000, Mega = 1800, Impossible = 2200},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}