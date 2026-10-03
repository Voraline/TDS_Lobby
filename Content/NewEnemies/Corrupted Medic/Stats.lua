-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Medic.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Null Medic",
    Description = "As enemies flooded through the tear, Null Medic followed. Her healing beam flickered with the unstable energy of the Nil Zone. The original Medic couldn’t help but smile creepily, the thought of dissecting it crossing her mind. Medic couldn't help but notice every detail down to the scars that mirrored her own.",
    Speed = 3.8,
    Health = 2500,
    Scale = 1.25,
    Range = 30,
    AttackDelay = 6,
    AttackRecharge = 12,
    HealthPerDifficulty = {Act2Easy = 1750, Act3Easy = 3000, Act2 = 8000, Act3 = 8000},
    Reward = {Act2Easy = 5000, Act3Easy = 6000, Act2 = 10000, Act3 = 8000},
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
    HealData = {HealTickRate = 0.2, HealAmount = 150},
}