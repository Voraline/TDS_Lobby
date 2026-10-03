-- Script path: ReplicatedStorage.Content.Consumables.Festive Tree.Data
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Festive Tree",
    Description = "A jolly tree dressed up for the Holidays! Reduces tower stuns by 30% for 45 seconds.",
    Icon = 132155797622156,
    Cooldown = 60,
    PreGameCooldown = 0,
    RequiresCursor = true,
    ConstrainToGround = false,
    CursorSize = 0,
    MaxUses = 3,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Rare,
    QueueType = Enum.ConsumableQueue.None,
}