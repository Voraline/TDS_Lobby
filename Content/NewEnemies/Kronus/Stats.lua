-- Script path: ReplicatedStorage.Content.NewEnemies.Kronus.Stats
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 150000,
    RewardThreshold = 0.5,
    Speed = 1.5,
    Phase2Threshold = 0.75,
    EliteHealthMultiplier = 1.5,
    Description = "When Trick or Threat Town was attacked, three brothers were saved by TDS from Lord Sinister. But the town's reputation was destroyed — some said it was too dangerous to visit. As the brothers left, Kronus found a God Shard that was left behind, along with Narrator. That's when Narrator promised that Lord Exo would rebuild the town, and the brothers could live together once more.",
    HealthPerDifficulty = {Act3 = 150000, Act3Easy = 50000},
    Reward = {Act3 = 120000, Act3Easy = 60000},
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.StunImmune,
    },
    Moveset = {
        TimeScale = {SlowDuration = 10, Cooldown = 5, AttackCooldown = 45, TimeScale = 0.2},
        SweepingIce = {
            Phase = 1,
            Range = 25,
            Radius = 25,
            Angle = 120,
            UnitDamage = 2000,
            FreezeTime = 5,
            Cooldown = 15,
            AttackCooldown = 5,
            FrostSpeed = 50,
        },
        IceStorm = {
            Phase = 1,
            Radius = 3,
            Range = 55,
            UnitDamage = 1000,
            FreezeTime = 5,
            Height = 50,
            Count = 25,
            Cooldown = 30,
            MinDelay = 1,
            MaxDelay = 3,
            AttackCooldown = 5,
        },
        Summon = {
            Cooldown = 20,
            AttackCooldown = 5,
            SummonTime = 2,
            Count = math.random(7, 10),
            Spawns = {
                {Name = "Corrupted Crook Boss", Chance = 80, Delay = 0.45},
                {Name = "Corrupted Warden", Chance = 5, Delay = 0.6},
                {Name = "Corrupted Electroshocker", Chance = 15, Delay = 0.5},
            },
        },
    },
}