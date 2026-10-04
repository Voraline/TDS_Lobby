-- Script path: ReplicatedStorage.Content.NewEnemies.Void Portal.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Portal is circular in shape, does a lot of spooky sounding things, and otherwise doesn’t like to be bothered. It simply likes to connect one place to another. That’s about it. If someone from the Void Army pesters a Void Portal enough it will intentionally send them to the outer far reaches of the eternal nothing, leaving them all alone for eternity. Void Caster knows the Void Portal does this, and out of pity will go and bring the unfortunate creature back to her army. Sometimes, she scolds the portal for it. The portal, however, doesn’t seem to care and will absolutely do it again. In fact. It already did.",
    Health = 6000,
    Speed = 0,
    GameModesDisplayOverride = {"Hardcore", "Voidcore"},
    HealthPerDifficulty = {Hard = 8000, Easy = 6000, NilZone2 = 100000},
    SpawnData = {
        chances = {common = 100, uncommon = 0},
        spawns = {common = {"Voidling"}, uncommon = {"Elite Phantom"}},
        Attributes = {nil},
    },
    SpawnDelay = NumberRange.new(0.15, 0.15),
    SpawnAmount = NumberRange.new(8, 8),
    RandomSpawnRate = NumberRange.new(14, 14),
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}