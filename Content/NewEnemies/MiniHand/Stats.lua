-- Script path: ReplicatedStorage.Content.NewEnemies.MiniHand.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 10,
    MaxHealth = 25000,
    RewardThreshold = 0.5,
    Range = 22.5,
    FOV = 20,
    StunTime = 2.5,
    UnitDamage = 275,
    Cooldown = 10,
    Description = "The Mini Hands cause a lot of mischief if left alone for too long. Righty and Lefty act as a kind of parent, making sure they don't do anything 'too' reckless. They communicate through gestures and all have unique personalities. Sometimes they will wrestle and throw tantrums and Narrator often refers to them all as ‘Junior’.",
    HealthPerDifficulty = {Hard = 17500, Easy = 8750},
    Reward = {Hard = 500, Easy = 600},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}