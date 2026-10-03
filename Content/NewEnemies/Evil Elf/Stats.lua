-- Script path: ReplicatedStorage.Content.NewEnemies.Evil Elf.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Shield = 500,
    MaxHealth = 1800,
    Reward = 5000,
    Speed = 2.5,
    Defense = 60,
    Archived = true,
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}