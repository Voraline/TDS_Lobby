-- Script path: ReplicatedStorage.Content.NewEnemies.Void Guardian.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Guardian is usually found surrounding the outskirts of the Void Army to protect them from the creatures that lie within it. Many of the giants that were created during the Old World by both Void Caster and Lord Exo have fallen, but not all died. Some slunk back into the darkness of the Void where they continue to reside. It’s unknown if they would ever resurface, but the Void Guardian stands guard regardless, for even the Void Caster barely has control over the creatures she had created. The will of the Void is a dangerous thing.",
    Health = 200000,
    Scale = 1.3,
    Speed = 1.9,
    FreezeTime = 10,
    Damage = 250,
    AddedShield = 25000,
    AttackRadius = 24,
    FOV = 15,
    StartCoolDown = 5,
    Cooldown = 15,
    HealthPerDifficulty = {Hard = 200000, Easy = 150000},
    Reward = {Hard = 100000, Easy = 100000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}