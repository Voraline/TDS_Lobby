-- Script path: ReplicatedStorage.Content.Consumables.Winter Storm.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Winter Storm",
    Description = "Releases a wave of cold air across the entire map slowing all enemies, applying a defense debuff, and dealing damage over-time",
    Icon = 7610093373,
    RequiresCursor = false,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Exclusive,
    QueueType = Enum.ConsumableQueue.Global,
}