-- Script path: ReplicatedStorage.Content.Enemies.Evil Elf.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Shield = 500,
    MaxHealth = 1800,
    Speed = 4,
    Defense = 60,
    Archived = true,
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
}