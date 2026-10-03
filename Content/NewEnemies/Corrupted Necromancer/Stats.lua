-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Necromancer.Stats
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Null Necromancer stumbled forward, hands clutching the staff for support. As it raised the staff, tombstones breached the ground and skeletons crawled to the surface. Necromancer smiled. The creature copied something that cost him everything to obtain, and that was unacceptable.",
    DisplayName = "Null Necromancer",
    Speed = 2.5,
    Health = 50000,
    Shield = 100000,
    Scale = 1.9,
    RewardThreshold = 0.2,
    AttackCooldown = 10,
    HealthPerDifficulty = {Act3 = 50000, Act3Easy = 25000},
    ShieldPerDifficulty = {Act3 = 100000, Act3Easy = 25000},
    Reward = {Act3 = 75000, Act3Easy = 75000},
    HealthPerGamemode = {Map2Adidas = {Easy = 12500, Hard = 25000}, Map3Adidas = {Easy = 4000, Hard = 6000}},
    RewardPerGamemode = {Map2Adidas = {Easy = 18500, Hard = 30000}, Map3Adidas = {Easy = 4000, Hard = 6000}},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    Moveset = {
        DarkProjectile = {
            Range = 25,
            Cooldown = 10,
            MoveDuration = 1,
            GrowTime = 0.25,
            HitboxSize = Vector3.new(4, 4, 20),
            StunLength = 4,
            UnitDamage = 100,
        },
        SummonGravestones = {
            Range = 25,
            MoveDuration = 2,
            NumGravestones = 5,
            Cooldown = 18,
            SpawnInterval = 2,
            Spawns = {
                {name = "Giant Skeleton", count = 4},
                {name = "Executioner Skeleton", count = 1},
                {name = "Hallow Guard", count = 4},
            },
        },
    },
}