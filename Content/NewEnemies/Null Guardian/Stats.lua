-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian.Stats
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Null Guardian has existed within the Nil Zone since before the Old World, appointed to this role by the Rift Walker himself. He patrols endlessly, destroying any who enter the ‘Place Between Realms’. The Guardian is connected to the chaotic energy of the Nil Zone, allowing him to perceive and experience the realm's history within it.",
    Speed = 1.8,
    Health = 500000,
    RewardThreshold = 0.05,
    DeathTime = 5,
    HealthPerDifficulty = {Act2Easy = 50000, Act2 = 500000},
    Reward = {Act2Easy = 200000, Act2 = 225000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    NullAura = {CooldownDebuff = 15, Range = 12},
    LaneSwitch = {Cooldown = 20, Offset = {Min = -2, Max = 2}, SwapLocations = {0.2, 0.5, 0.8}},
    Moveset = {
        SummonClones = {Cooldown = 45, TotalSpawns = 3, Spawns = {["Null Guardian Clone"] = {amount = 3}}},
        NullBubble = {Cooldown = 15, Range = 20, RangeDebuff = -25, EffectRadius = 20},
        CosmicSpear = {
            Cooldown = 20,
            Range = 30,
            UnitDamage = 1500,
            StunTime = 2,
            ExplosionRadius = 8,
            FireRate = 0.35,
            TimeToLand = 1,
            MaxTargets = 10,
        },
    },
}