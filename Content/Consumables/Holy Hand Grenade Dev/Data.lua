-- Script path: ReplicatedStorage.Content.Consumables.Holy Hand Grenade Dev.Data
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Holy Hand Grenade",
    Description = "An piece of dee-vine intervention.",
    Icon = 110415073436604,
    RequiresCursor = true,
    LockedToPath = false,
    MaxUses = 2,
    Cooldown = 120,
    PreGameCooldown = 1,
    Rarity = Enum.ConsumableRarity.Exclusive,
    CooldownType = Enum.CooldownType.Instant,
}