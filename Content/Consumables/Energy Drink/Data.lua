-- Script path: ReplicatedStorage.Content.Consumables.Energy Drink.Data
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Energy Drink",
    Description = "Apply Nimble modifier to the next 3 summoned enemies",
    Icon = 75633408869837,
    Cost = 1400,
    Cooldown = 50,
    PreGameCooldown = 50,
    RequiresCursor = false,
    SingleUse = false,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}