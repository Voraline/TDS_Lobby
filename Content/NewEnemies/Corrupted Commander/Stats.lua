-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Commander.Stats
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "When the Null Commander emerged from the tear, Commander froze, his weapon lowering at the sight before him. Dispatcher's voice cut through the shock, snapping him back to reality. Commander raised his gun and fired, but the bullets ricocheted off its armor. But when the Null Commander chuckled and raised its radio, Commander's blood ran cold.",
    DisplayName = "Null Commander",
    Speed = 2.2,
    Scale = 1.25,
    Health = 50000,
    RewardThreshold = 0.05,
    DeathTime = 5.2,
    HealthPerDifficulty = {Act1Easy = 25000, Act1 = 80000},
    Reward = {Act1Easy = 80000, Act1 = 80000},
    Attributes = {},
    Moveset = {
        OpenFire = {
            Range = 30,
            MinRange = 2,
            Damage = 200,
            Cooldown = 35,
            StunTime = 6,
            Duration = 3.95,
        },
        SummonAPCs = {Cooldown = 40, NumAPCs = 3, Duration = 2, Spawns = {["Corrupted Missile APC"] = {amount = 3}}},
        CallToWar = {
            Cooldown = 60,
            NumEnemies = 10,
            Duration = 3,
            Spawns = {
                ["Corrupted Scout"] = {amount = 6, Defense = 50, modifiers = {[Enum.Modifier.Bloated] = true}},
                ["Corrupted Crook Boss"] = {amount = 4, Defense = 50, modifiers = {[Enum.Modifier.Bloated] = true}},
                ["Corrupted Pyromancer"] = {amount = 1, Defense = 50, modifiers = {}},
            },
        },
    },
}