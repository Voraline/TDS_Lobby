-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Rusher.Stats
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    MaxHealth = 800,
    Shield = 800,
    Speed = 12,
    ShieldBrokenSpeed = 6,
    Defense = 80,
    Scale = 1.2,
    Description = "Fallen Rushers were the kingdom's frontline shield, trained to charge head-first into battle. Their role was to push through the enemy defenses. They wore light armor for speed and most knew they would not survive, but they did it willingly to protect those who followed after them. Their shield can be destroyed, leaving them defenseless.",
    HealthPerDifficulty = {Fallen = 900, PVP_highRanks = 300, SummerExperimental = 400},
    Reward = {Insane = 1500, Fallen = 1000, PVP_highRanks = 1500, SummerExperimental = 750},
    Attributes = {},
}