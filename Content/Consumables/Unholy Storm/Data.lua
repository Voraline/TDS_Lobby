-- Script path: ReplicatedStorage.Content.Consumables.Unholy Storm.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Unholy storm",
    Description = "Releases a burning plague to all enemies for 25 seconds, dealing burn and poison damage over time while reducing enemy defense and speed.",
    Icon = 117934574143583,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 3,
    Cooldown = 45,
    PreGameCooldown = 30,
    Duration = 6,
    Rarity = Enum.ConsumableRarity.Epic,
    CooldownType = Enum.CooldownType.Instant,
}