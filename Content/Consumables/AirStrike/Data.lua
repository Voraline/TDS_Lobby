-- Script path: ReplicatedStorage.Content.Consumables.AirStrike.Data
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Air-Strike",
    Description = "Calls in a quick AOE air-strike on a designated area. Drops 6 bombs that deal 200 damage each.",
    Icon = 17448596007,
    RequiresCursor = true,
    LockedToPath = true,
    MaxUses = 4,
    CursorSize = 10,
    Cooldown = 30,
    PreGameCooldown = 30,
    Rarity = Enum.ConsumableRarity.Uncommon,
    CooldownType = Enum.CooldownType.Instant,
}