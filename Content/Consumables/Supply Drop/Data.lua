-- Script path: ReplicatedStorage.Content.Consumables.Supply Drop.Data
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Supply Drop",
    Description = "Drops a supply crate that grants 1,000 cash.",
    Icon = 17429548305,
    RequiresCursor = true,
    MaxUses = 3,
    Cooldown = 60,
    PreGameCooldown = 75,
    Rarity = Enum.ConsumableRarity.Uncommon,
    CooldownType = Enum.CooldownType.Instant,
}