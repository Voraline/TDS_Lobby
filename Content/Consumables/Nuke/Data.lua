-- Script path: ReplicatedStorage.Content.Consumables.Nuke.Data
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Nuke",
    Description = "Drop a single high power bomb on a designated area. Deals 75,000 damage at the impact point.",
    Icon = 17430415569,
    RequiresCursor = true,
    MaxUses = 1,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Legendary,
    QueueType = Enum.ConsumableQueue.Global,
}