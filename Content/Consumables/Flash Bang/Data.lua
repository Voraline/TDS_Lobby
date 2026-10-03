-- Script path: ReplicatedStorage.Content.Consumables.Flash Bang.Data
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Flash Bang",
    Description = "Throws a flashbang on the designated area that stuns enemies for 4 seconds.",
    Icon = 17430416205,
    RequiresCursor = true,
    MaxUses = 5,
    Cooldown = 5,
    PreGameCooldown = 5,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
}