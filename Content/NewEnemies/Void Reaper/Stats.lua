-- Script path: ReplicatedStorage.Content.NewEnemies.Void Reaper.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Reaper hunts the wandering Souls that are created after a realm’s death. They herd them like sheep and drive the Souls into finding their individual identity once more so they can be fully incorporated into the Void army. Some Souls can be disobedient or still hold onto fragments of their past selves. If this is the case, the Void Reaper will slice the Soul in two, and they will be forever lost to the Void.",
    Health = 2250,
    Speed = 3,
    HealthPerDifficulty = {Hard = 2750, Easy = 2250, NilZone2 = 400},
    Reward = {Hard = 900, Easy = 1200, NilZone2 = 400},
    Attacks = {Summon = {Amount = 4, Delay = 0.4, Cooldown = 20, Spawns = {{Name = "Mystery", Weight = 100}}}},
    SpawnPools = {{{enemy = "Mystery", amount = 4}}},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}