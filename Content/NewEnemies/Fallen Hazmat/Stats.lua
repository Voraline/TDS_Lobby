-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Hazmat.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 3.5,
    MaxHealth = 400,
    Defense = 60,
    Description = "Fallen Hazmats were created after the curse had taken hold over the kingdom. Unlike the other Fallen, the Hazmats are manifestations of the curse itself. They are more violent and unpredictable than other Fallen, driven by a hunger to prove their worth. Despite their chaotic nature, they remain loyal to the Fallen King and constantly search for powerful enemies to fight and cursed artifacts to bring to their master.",
    HealthPerDifficulty = {Fallen = 400, PVP_highRanks = 150, SummerExperimental = 400},
    Reward = {Fallen = 480, PVP_highRanks = 350, SummerExperimental = 200},
    Attributes = {
        Enum.Modifier.FireImmune,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.StunImmune,
    },
}