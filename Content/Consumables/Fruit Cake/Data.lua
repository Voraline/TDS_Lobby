-- Script path: ReplicatedStorage.Content.Consumables.Fruit Cake.Data
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Fruit Cake",
    Description = "A hearty fruit cake that Restores a total of 50 HP over 10 seconds",
    Icon = 124065875200929,
    RequiresClick = true,
    MaxUses = 2,
    Cooldown = 10,
    PreGameCooldown = 20,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Common,
    CooldownType = Enum.CooldownType.Instant,
    QueueType = Enum.ConsumableQueue.None,
}