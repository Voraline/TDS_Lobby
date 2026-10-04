-- Script path: ReplicatedStorage.Content.Consumables.Heatwave.Data
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Heat wave",
    Description = "Map-wide heatwave that burns and deals damage over time to all enemies for a short duration.",
    Icon = 127887535288381,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 3,
    Cooldown = 30,
    PreGameCooldown = 30,
    LifeTime = 6,
    Rarity = Enum.ConsumableRarity.Epic,
    CooldownType = Enum.CooldownType.Instant,
}