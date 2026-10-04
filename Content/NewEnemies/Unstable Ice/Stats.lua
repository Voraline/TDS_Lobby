-- Script path: ReplicatedStorage.Content.NewEnemies.Unstable Ice.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 1.1,
    Speed = 7.25,
    Health = 800,
    Range = 40,
    MinRange = 10,
    ExplosionRange = 8,
    DebuffAmount = 20,
    DebuffDuration = 5,
    UnitDamage = 50,
    Description = "After a massive avalanche, the sudden compaction of energized snow sparks new life as an Unstable Ice. Lopsided with thick shards protruding from its body, the Unstable Ice can often be found roaming the lower mountain side. The energy from the avalanche is stored within their body and explodes out after death, freezing towers and units.",
    HealthPerDifficulty = {Easy = 400, Hard = 800, Frost = 750},
    Reward = {Easy = 500, Hard = 1000, Frost = 560},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
    ProjectileData = {velocity = 4, gravity = -1, dtMultiplier = 9},
}