-- Script path: ReplicatedStorage.Content.NewEnemies.Lead.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Molten material was poured on the bodies of Odds and molded by the blacksmiths. If they were lucky enough to survive, it would be nearly impossible for the Leads to take damage. In fact, this worked so well that Odds were beginning to run from the selection process, with many dragged back. If the Odds still had their individuality, it was most apparent during this part.",
    Speed = 3.2,
    Health = 80,
    Shield = 40,
    ShieldPerDifficulty = {Hard = 40, Easy = 40},
    HealthPerDifficulty = {Hard = 80, Easy = 30},
    Attributes = {Enum.Modifier.Lead, Enum.Modifier.StunImmune},
    Reward = {Hard = 20, Easy = 15},
}