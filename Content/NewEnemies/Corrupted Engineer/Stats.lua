-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Engineer.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Engineer",
    Description = "When the Null Engineer emerged from the tear it caught Engineer's attention. She watched as the creature placed down a turret identical to her own. Engineer's jaw tightened as she pulled down her goggles. \"Cheap knockoff,\" she muttered, goggles guiding her own turret as it whirred to life.",
    Speed = 2.5,
    Health = 7500,
    Shield = 4500,
    RewardThreshold = 0.5,
    Defense = 40,
    Scale = 1.6,
    Range = 20,
    AttackCooldown = 10,
    HealthPerDifficulty = {Act3 = 7500, Act3Easy = 3750, NilZone2 = 15000},
    ShieldPerDifficulty = {Act3 = 4500, Act3Easy = 2250, NilZone2 = 4500},
    Reward = {Act3 = 10000, Act3Easy = 7500, NilZone2 = 1000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
    Moveset = {
        Attack = {StunTime = 1, UnitDamage = 3000, Cooldown = 4},
        SpawnTurret = {SentryHealth = 1000, CooldownDebuff = -40, SentryRange = 20, Cooldown = 12},
    },
}