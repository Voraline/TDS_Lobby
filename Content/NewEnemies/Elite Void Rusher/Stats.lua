-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Void Rusher.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Elite Void Rusher’s shield is made out of a special material forged in the Void. It’s faster, heavier, and more armored than the Void Rusher. It will continue to charge forward regardless of its own safety to cut an opening for the army to seep into. They are fundamentally the most important fighters on the battlefield, and it’s best not to take them lightly. They are what punches the hold for the Void to flow through.",
    Health = 3000,
    Shield = 1000,
    Speed = 12,
    ShieldBrokenSpeed = 5,
    Defense = 40,
    DefenseNoShield = 0,
    Scale = 1.4,
    HealthPerDifficulty = {Hard = 5000, Easy = 4000},
    ShieldPerDifficulty = {Hard = 2500, Easy = 1000},
    Reward = {Hard = 700, Easy = 2000},
    Attributes = {},
}