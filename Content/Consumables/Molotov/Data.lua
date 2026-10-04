-- Script path: ReplicatedStorage.Content.Consumables.Molotov.Data
-- Decompile time: 0.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Molotov",
    Description = "Throw a molotov grenade at a position that applies burn for 6 seconds",
    Icon = 17437703262,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 5,
    Cooldown = 25,
    PreGameCooldown = 15,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
}