-- Script path: ReplicatedStorage.Content.NewEnemies.Projector.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    Health = 30000,
    Scale = 1.3,
    RewardThreshold = 0.25,
    Defense = 30,
    Cooldown = 10,
    Range = 20,
    FOV = 60,
    StunTime = 2.5,
    UnitDamage = 700,
    Windup = 1,
    Rest = 0.1,
    LaserTime = 2.75,
    TickRate = 0.1,
    Description = "The Projector Man is a stark reminder of the Narrator's twisted mind. It is used to display movies for entertainment or project screens for plays. The Projector Man was once a whole person, but was reconstructed to serve the Narrator's purposes. When alone, it finds a quiet corner and projects memories of its past life, reminiscing about happier times.",
    HealthPerDifficulty = {Easy = 15000, Hard = 35000},
    Reward = {Easy = 20000, Hard = 20000},
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.ExplosionImmune,
    },
}