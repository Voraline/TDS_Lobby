-- Script path: ReplicatedStorage.Content.NewEnemies.Void Trickster.Stats
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Trickster is a summoner who opens the gate for enemies to run through. In the Void, there are places called Vaults where thousands of enemies reside. The Vaults are pits in the ground that enemies cannot escape from, where the ground is loaded with plants and flowers for the creatures to lay their heads upon. When a gate is created, instinctually the enemies will run in that direction and spew out the other side, attacking the first thing they see. Void Tricksters are a specialized variant of Odd that Void Caster bestows a curse upon. The clothes they wear are to symbolize their group. Although time isn’t able to be told in the Void, they often meet to share stories, practice magic, and have the occasional gossip.",
    Scale = 1.3,
    Speed = 1.9,
    MaxHealth = 20000,
    Health = 20000,
    HealthPerDifficulty = {Hard = 20000, Easy = 20000},
    Reward = {Hard = 10000, Easy = 10000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    GlobalCooldown = NumberRange.new(5, 5),
    AttackInfo = {
        Portal = {
            Cooldown = NumberRange.new(18, 18),
            PortalSpawnRange = NumberRange.new(6, 12),
        },
        Summon = {
            Cooldown = 30,
            Amount = NumberRange.new(1, 1),
            SpawnData = {chances = {common = 100}, spawns = {common = {"Speedy King"}}},
        },
    },
}