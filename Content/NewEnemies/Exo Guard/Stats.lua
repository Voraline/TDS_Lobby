-- Script path: ReplicatedStorage.Content.NewEnemies.Exo Guard.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    HealthScale = 150,
    Speed = 2.5,
    Scale = 1.1,
    MaxHealth = 1500,
    Defense = 40,
    RewardThreshold = 0.25,
    Description = "The Exo Guard was created by Righty as a precise replica for the Narrator's Final Act. Each button was carefully sewn on, along with other intricate details. However, because so many needed to be made, Righty asked Lefty for help, but Lefty lazily refused. Because of the care Righty put into creating these guards, it feels resentment towards TDS for destroying them.",
    HealthPerDifficulty = {Hard = 1500, Easy = 850},
    Reward = {Hard = 1500, Easy = 1200},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}