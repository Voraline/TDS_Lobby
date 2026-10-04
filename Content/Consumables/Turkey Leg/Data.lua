-- Script path: ReplicatedStorage.Content.Consumables.Turkey Leg.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Turkey Leg",
    Description = "Celebrate the Fall season with a delicious turkey leg! It also heals you for 100 HP.",
    Icon = 128078447476652,
    RequiresClick = true,
    MaxUses = 4,
    Cooldown = 60,
    PreGameCooldown = 10,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
    QueueType = Enum.ConsumableQueue.None,
}