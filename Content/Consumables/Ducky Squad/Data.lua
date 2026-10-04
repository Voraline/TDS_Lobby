-- Script path: ReplicatedStorage.Content.Consumables.Ducky Squad.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Ducky Squad",
    Description = "Send forth 5 explosive elemental duckies into battle!",
    Icon = 100201829226448,
    RequiresCursor = false,
    MaxUses = 3,
    Cooldown = 30,
    PreGameCooldown = 30,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Epic,
    QueueType = Enum.ConsumableQueue.Global,
}