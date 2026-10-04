-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Electroshocker.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Electroshocker",
    Description = "The Null Electroshocker emerged crackling with purple energy, voltage surging through his body. He trembled with power, storing massive quantities of it within his body as he prepared to release a destructive burst. Electroshocker's eyes narrowed. Disgusting.",
    Speed = 6.5,
    Health = 1500,
    Scale = 1.3,
    MaxHitsOnDeath = 5,
    StunTime = 5,
    ChainRange = 15,
    UnitDamage = 1000,
    HealthPerDifficulty = {
        Act2Easy = 500,
        Act3Easy = 500,
        Act2 = 1000,
        Act3 = 1000,
        NilZone2 = 3500,
    },
    ShieldPerDifficulty = {
        Act2Easy = 750,
        Act3Easy = 300,
        Act2 = 1500,
        Act3 = 500,
        NilZone2 = 0,
    },
    Reward = {
        Act2Easy = 1000,
        Act3Easy = 1500,
        Act2 = 3000,
        Act3 = 1500,
        NilZone2 = 6000,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}