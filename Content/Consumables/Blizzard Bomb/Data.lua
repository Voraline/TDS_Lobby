-- Script path: ReplicatedStorage.Content.Consumables.Blizzard Bomb.Data
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
return {
    Name = "Blizzard Bomb",
    Description = "Creates an isolated blizzard inside of a radius for 30 seconds that slows and freezes enemies nearby.",
    Icon = 17429537022,
    RequiresCursor = true,
    LockedToPath = true,
    MaxUses = 5,
    Cooldown = 20,
    PreGameCooldown = 10,
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).ConsumableRarity.Epic,
}