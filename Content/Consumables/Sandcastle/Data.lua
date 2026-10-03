-- Script path: ReplicatedStorage.Content.Consumables.Sandcastle.Data
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Sandcastle Barricade",
    Description = "Place a temporary barricade with 1000 health. Gradually spawns crab units out of it.",
    Icon = 99763208958892,
    RequiresCursor = true,
    LockedToPath = true,
    MaxUses = 4,
    SingleUse = true,
    Cooldown = 60,
    PreGameCooldown = 45,
    Rarity = Enum.ConsumableRarity.Uncommon,
    CooldownType = Enum.CooldownType.Instant,
    QueueType = Enum.ConsumableQueue.None,
}