-- Script path: ReplicatedStorage.Content.NewEnemies.Nightshade.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Nightshade are creatures that were once Odds, but the Odd had died in some way. If the corpse was lucky enough to have fallen onto the flora of the Void, they were then consumed by the overgrowth and turned into a Nightshade. It’s up for debate whether you could call them living, as the flowers have completely set root throughout their entire bodies, but it wouldn’t be far-fetched to say they are being controlled by it. The flowers throughout the Void sometimes have sentience, as flora finds nutrients through corpses as they decompose. Sometimes, a Nightshade will wander. Not to anything specific. It just drifts to wherever the flowers feel like going that day.",
    Scale = 1.3,
    Speed = 4.5,
    Health = 8000,
    HealthPerDifficulty = {Hard = 7500, Easy = 4000, NilZone2 = 2000},
    Reward = {Hard = 2500, Easy = 2000, NilZone2 = 1500},
    Attributes = {Enum.Modifier.StunImmune},
    SpawnPools = {
        {
            {enemy = "Elite Mystery", amount = 2},
            {enemy = "Blighted", amount = 1},
            {
                enemy = "Mandrake",
                amount = 3,
                Modifier = {Enum.Modifier.Bloated, Enum.Modifier.Nimble},
            },
        },
    },
}