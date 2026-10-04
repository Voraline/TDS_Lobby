-- Script path: ReplicatedStorage.Content.Consumables.Grenade.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Grenade",
    Description = "Throw a grenade at a position that deals 125 damage.",
    Icon = 17429533728,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 6,
    Cooldown = 20,
    PreGameCooldown = 10,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
}