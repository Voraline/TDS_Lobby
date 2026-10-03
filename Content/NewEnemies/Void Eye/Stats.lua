-- Script path: ReplicatedStorage.Content.NewEnemies.Void Eye.Stats
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Eyes are pulled from what were once creatures that roamed the Void. Even now, there are many things that have bloomed within the darkness after realms have found their peace. Nothing is left to waste, and some of the more valuable parts are turned into pieces of the Void Caster’s army. When they aren’t attacking, they weep quietly to themselves, hidden off in a corner until they are needed again.",
    Speed = 0.0001,
    Health = 20000,
    Range = 22.5,
    MinRange = 7.5,
    ExplosionRadius = 4,
    UnitDamage = 200,
    StunDuration = 3,
    FaceDelay = 0.5,
    InitialDelay = 3,
    GameModesDisplayOverride = {"Hardcore", "Voidcore"},
    HealthPerDifficulty = {Hard = 15000, Easy = 15000},
    AttackDelay = NumberRange.new(4, 5),
    targetOffset = NumberRange.new(1, 2),
    ProjectileData = {gravity = -1, velocity = 2, dtMultiplier = 6},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}