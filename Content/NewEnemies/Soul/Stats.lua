-- Script path: ReplicatedStorage.Content.NewEnemies.Soul.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Soul is what is left when a realm ends and the dead have not passed into the afterlife. They will drift aimlessly across the Nil Zone once the realm is completely destroyed, and are either eaten up by whatever may have survived the collapse or captured for use. In this case, the Void consumed many realms before their battle with TDS. Where there were once countless realms, the Void devoured nearly all of them in a short span of time. Now, few remain unaccounted for.",
    Scale = 1.2,
    Speed = 7,
    MaxHealth = 2500,
    HealthPerDifficulty = {Hard = 3000, Easy = 2500},
    Reward = {Hard = 1500, Easy = 2250},
    Attributes = {Enum.Modifier.Hidden, Enum.Modifier.Ghost},
}