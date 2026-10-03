-- Script path: ReplicatedStorage.Content.NewEnemies.Void Rusher.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Void Rushers are created once Swifts earn their ranking and are promoted into carrying the Shield of the Void. How they go about choosing who is and who is not fit for the title is unknown, but once they pick up the shield it is forbidden to place it down. The shield weighs more than their own bodies, yet even that is lighter than the burden of holding the frontline of the Void.",
    Health = 350,
    Shield = 250,
    Speed = 12,
    ShieldBrokenSpeed = 5,
    Defense = 40,
    DefenseNoShield = 0,
    Scale = 1.2,
    ShieldPerDifficulty = {Hard = 400, Easy = 200},
    HealthPerDifficulty = {Hard = 1200, Easy = 800},
    Reward = {Hard = 400, Easy = 300},
    Attributes = {},
}