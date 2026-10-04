-- Script path: ReplicatedStorage.Content.Consumables.Necromancer's Tome.Data
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Necromancer's Tome",
    Description = "For the next 10 seconds any enemy killed spawns one of Necromancer's units at random.",
    Icon = 138905785270725,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 2,
    Cooldown = 60,
    PreGameCooldown = 45,
    Duration = 10,
    Rarity = Enum.ConsumableRarity.Epic,
    CooldownType = Enum.CooldownType.Instant,
}