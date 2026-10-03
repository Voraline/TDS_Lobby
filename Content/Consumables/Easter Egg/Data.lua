-- Script path: ReplicatedStorage.Content.Consumables.Easter Egg.Data
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Easter Egg",
    Description = "A special egg that grants a temporary buff to the tower it is used on.",
    Icon = 115421293343588,
    Cooldown = 5,
    PreGameCooldown = 10,
    RequiresCursor = true,
    CursorSize = 10,
    MaxUses = 5,
    SingleUse = false,
    Rarity = Enum.ConsumableRarity.Uncommon,
    QueueType = Enum.ConsumableQueue.None,
}