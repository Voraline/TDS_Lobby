-- Script path: ReplicatedStorage.Content.Consumables.Present Cluster Bomb.Data
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Present Cluster Bomb",
    Description = "An explosive present that releases a cluster of explosives. (May also stun towers in the blast radius)",
    Icon = 139414922355803,
    RequiresCursor = true,
    MaxUses = 4,
    Cooldown = 60,
    PreGameCooldown = 0,
    Rarity = Enum.ConsumableRarity.Uncommon,
    CooldownType = Enum.CooldownType.Instant,
}