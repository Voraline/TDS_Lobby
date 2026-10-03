-- Script path: ReplicatedStorage.Content.Consumables.Napalm Strike.Data
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Napalm Strike",
    Description = "Airstrike that leaves an AOE field around the designated spot, applying burn to enemies that pass through.",
    Icon = 17448596749,
    RequiresCursor = true,
    MaxUses = 3,
    Cooldown = 40,
    PreGameCooldown = 30,
    Rarity = Enum.ConsumableRarity.Rare,
    CooldownType = Enum.CooldownType.Instant,
}