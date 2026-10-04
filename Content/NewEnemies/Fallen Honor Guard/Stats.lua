-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Honor Guard.Stats
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 0.9,
    Health = 75000,
    StunTime = 6,
    AttackCD = 15,
    HitRadius = 6,
    RewardThreshold = 0.33,
    Damage = 250,
    BuffLifetime = 1,
    SpdBuff = 10,
    Description = "Fallen Honor Guards were the elite of the elite, chosen personally by the King to defend the kingdom's most sacred sites. They were there when the King failed to find new magic, and they stood guard as the Queen met her end. They are the Fallen King's most prized guards who had fallen, just as he did.",
    HealthPerDifficulty = {Fallen = 100000, Impossible = 120000, SummerExperimental = 50000},
    Reward = {Insane = 100000, Fallen = 100000, PVP_highRanks = 100000, SummerExperimental = 50000},
    PuddleData = {InitialCooldown = 1, SpawnRate = 0.5, LifeTime = 360, Radius = 2.5},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}