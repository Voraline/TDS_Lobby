-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Mage.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 12500,
    Defense = 25,
    RewardThreshold = 0.25,
    Speed = 2.2,
    Scale = 1.3,
    Range = 28,
    ExplosionRadius = 10,
    UnitDamage = 150,
    StunTime = 3,
    Cooldown = 20,
    Description = "Frost Mages are envied by the Crying Angels for reaching sainthood in their beliefs where the Frost Spirit grants them a portion of its power. Though chained by their duties, they remain devoted followers, their clothing reflecting both their strict order and granted freedoms. They fire ice projectiles at towers and units, dealing Area of Effect damage.",
    HealthPerDifficulty = {Easy = 1500, Hard = 4500, Frost = 7500},
    Reward = {Easy = 2500, Hard = 5000, Frost = 4500},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}