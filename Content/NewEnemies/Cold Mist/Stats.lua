-- Script path: ReplicatedStorage.Content.NewEnemies.Cold Mist.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.75,
    Health = 200,
    Archived = true,
    Description = "Cold Mists haunt battlefields within the Frost Realm, feeding off fallen creatures' energy as they drift through the air on wisps of snow. Though they can phase through any being, although, living creatures touched by a Cold Mist will freeze from the inside out. Composed of extremely cold moisture, they appear almost invisible.",
    HealthPerDifficulty = {Easy = 90, Hard = 350, Frost = 135},
    Reward = {Easy = 125, Hard = 350, Frost = 135},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}