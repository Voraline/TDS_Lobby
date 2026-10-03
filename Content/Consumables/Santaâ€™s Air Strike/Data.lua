-- Script path: ReplicatedStorage.Content.Consumables.Santa’s Air Strike.Data
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Santa’s Air Strike",
    Description = "Airstrike that leaves an AOE field around the designated spot, applying freeze to enemies that pass through.",
    Icon = 136180382135048,
    RequiresCursor = true,
    MaxUses = 4,
    Cooldown = 30,
    PreGameCooldown = 30,
    Rarity = Enum.ConsumableRarity.Rare,
    CooldownType = Enum.CooldownType.Instant,
}