-- Script path: ReplicatedStorage.Content.NewEnemies.Super Soldier Ducky.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Super Soldier Duck is what \"beak\" performance looks like. He is the type to take himself too seriously and can be overdramatic when it comes to his dramatizations of past events, telling insane mission stories like flying a jet through a train tunnel and kidnapping someone named \"Scout.\" Although, who knows what stories are true.",
    Speed = 4,
    MaxHealth = 1000,
    RewardThreshold = 0.5,
    Range = 20,
    Defense = 25,
    Cooldown = 10,
    ProjSpeed = 20,
    ShotCount = 3,
    ExplosionRadius = 6,
    StunTime = 3,
    UnitDamage = 500,
    HealthPerDifficulty = {Hard = 3500, Easy = 2000},
    Reward = {Hard = 2625, Easy = 2000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}