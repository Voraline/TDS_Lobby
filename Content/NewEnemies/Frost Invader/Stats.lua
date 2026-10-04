-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Invader.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.75,
    MaxHealth = 850,
    Defense = 0,
    RewardThreshold = 0.2,
    Scale = 1.2,
    Description = "Frost Invaders move in groups, charging into battle with their hand-forged armor that deflects most attacks. Their capes, crafted from fine Crystal Horn wool, provide additional lightweight protection against ranged units. These high-health units enter the battlefield strategically, waiting until their target has been weakened.",
    HealthPerDifficulty = {Easy = 225, Hard = 550, Frost = 850},
    Reward = {Easy = 225, Hard = 450, Frost = 640},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.Lead},
}