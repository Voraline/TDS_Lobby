-- Script path: ReplicatedStorage.Content.Consumables.Protein Shake.Data
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Protein Shake",
    Description = "Apply Bloated modifier to the next 3 summoned enemies",
    Icon = 89879347446202,
    Cost = 1000,
    Cooldown = 45,
    PreGameCooldown = 45,
    RequiresCursor = false,
    SingleUse = false,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}