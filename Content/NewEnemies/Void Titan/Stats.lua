-- Script path: ReplicatedStorage.Content.NewEnemies.Void Titan.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "During the battle with Two X and Lord Exo, the Void Titans stood with their hammers on the frontlines of battle. They slaughtered countless fighters and were part of the effort when Lord Exo was slaying millions. Lord Exo’s influence would not have been as vast without the efforts of the Void, and residents were hunted down and gathered by the Titans to be offered to the Void Caster.",
    Speed = 2.7,
    Health = 30000,
    InitialCooldown = 5,
    Range = 10,
    AttackRadius = 8,
    StunTime = 3,
    UnitDamage = 135,
    Cooldown = 17.5,
    ShockwaveAmount = 3,
    ShockwaveOffset = 5,
    ShockwaveDelay = 0.2,
    Scale = 1.5,
    HealthPerDifficulty = {Hard = 40000, Easy = 27500, NilZone2 = 35000},
    Reward = {Hard = 10000, Easy = 15000, NilZone2 = 12000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}