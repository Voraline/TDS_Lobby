-- Script path: ReplicatedStorage.Content.NewEnemies.Stereo Man.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 5000,
    Shield = 2500,
    Defense = 40,
    Speed = 3.25,
    RewardThreshold = 0.25,
    ExplosionRadius = 15,
    StunTime = 2,
    UnitDamage = 750,
    RecoveryTime = 2.5,
    Description = "The Stereo-Man was created by Narrator so he could listen to his favorite tunes throughout the ages. He would spend hours listening as he writes his plays. If tuned to the correct frequency, it will send out a shockwave. Lefty particularly dislikes the Stereo-Man as the music it plays is often warped or distorted.",
    HealthPerDifficulty = {Easy = 2500, Hard = 5000},
    ShieldPerDifficulty = {Easy = 2500, Hard = 5000},
    Reward = {Easy = 10750, Hard = 12750},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}