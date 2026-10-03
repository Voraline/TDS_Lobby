-- Script path: ReplicatedStorage.Content.NewEnemies.Beacon.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Scale = 1.35,
    DisplayName = "Healing Beacon",
    Speed = 20,
    Health = 1,
    Reward = 0,
    HealRate = 1100,
    HealRadius = 8,
    HealTickRate = 0.1,
    Lifetime = 6,
    Attributes = {
        Enum.Modifier.Invincible,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}