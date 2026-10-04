-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Pursuit.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Null Pursuit",
    Description = "The Null Pursuit flew in, leaving Engineer in awe as it was piloted by two skeletal figures within. She spent ages perfecting that rotorcraft, and the Nil Zone copied every last detail down to the missiles it fired at her team. Once Engineer built another sentry in annoyance, she pulled out her notepad and wrote 'Add: Remote pilot ejection.'",
    Speed = 3,
    Health = 8500,
    RewardThreshold = 0.5,
    Defense = 50,
    Range = 15,
    AttackCooldown = 5,
    AttackExplosionRadius = 6,
    AttackUnitDamage = 200,
    AttackLength = 5,
    AttackDamageDebuff = -25,
    AttackNumMissiles = 8,
    TimeBetweenFire = 0.05,
    TimeBetweenAimAndFire = 0.25,
    TimeToFire = 0.25,
    HighlightTargetDuration = 2,
    HealthPerDifficulty = {Act3 = 8500, Act3Easy = 4250},
    Reward = {Act3 = 10000, Act3Easy = 7500},
    Attributes = {Enum.Modifier.Flying, Enum.Modifier.FreezeImmune},
}