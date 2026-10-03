-- Script path: ReplicatedStorage.Content.Consumables.Sugar Rush.Data
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Sugar Rush",
    Description = "A chocolate bar that increases the fire rate of all your towers but causes them to have a sugar crash shortly after.",
    Icon = 114595010548022,
    RequiresClick = true,
    MaxUses = 3,
    Cooldown = 45,
    PreGameCooldown = 30,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Rare,
    CooldownType = Enum.CooldownType.Post,
    QueueType = Enum.ConsumableQueue.None,
}