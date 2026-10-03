-- Script path: ReplicatedStorage.Content.NewEnemies.Performer.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    Health = 70,
    Range = 40,
    MinRange = 5,
    ExplosionRange = 6,
    UnitDamage = 100,
    FreezeTime = 1,
    Description = "The Performer leaps into the air to perform acrobatics. Their bodies are made of paper, making them light enough to stay airborne for extended periods of time. For entertainment, the Narrator will sometimes swat one out of the sky and watch the confetti fall to the floor. This always seems to give him a laugh.",
    HealthPerDifficulty = {Easy = 45, Hard = 70},
    Reward = {Easy = 140, Hard = 175},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
    ProjectileData = {velocity = 4, gravity = -1, dtMultiplier = 9},
}