-- Script path: ReplicatedStorage.Content.NewEnemies.Snow Golem.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 1.2,
    Speed = 4,
    MaxHealth = 200,
    Defense = 0,
    AmountSpawn = 2,
    Description = "Like the Snowman, the Snow Golem was created from energized ice debris found in the depths of the Frost Realm. These massive beings emerge when Snowmen, locked in battles for dominance, become consumed by their fury and merge into a single, towering Golem. When defeated, the Snowmen entangled are freed.",
    HealthPerDifficulty = {Easy = 150, Hard = 300, Frost = 200},
    Reward = {Easy = 200, Hard = 300, Frost = 320},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}