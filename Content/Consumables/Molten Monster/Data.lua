-- Script path: ReplicatedStorage.Content.Consumables.Molten Monster.Data
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Molten Monster",
    Description = "RELEASE THE BEAST!",
    Icon = 95120437798143,
    RequiresCursor = false,
    MaxUses = 1,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Legendary,
    QueueType = Enum.ConsumableQueue.Global,
}