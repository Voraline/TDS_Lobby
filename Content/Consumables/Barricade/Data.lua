-- Script path: ReplicatedStorage.Content.Consumables.Barricade.Data
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Barricade",
    Description = "Place a temporary barricade with 300 health.",
    Icon = 17429541513,
    RequiresCursor = true,
    LockedToPath = true,
    MaxUses = 4,
    SingleUse = true,
    Cooldown = 30,
    PreGameCooldown = 10,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
    QueueType = Enum.ConsumableQueue.None,
}