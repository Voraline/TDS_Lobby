-- Script path: ReplicatedStorage.Content.Consumables.Airhorn.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Airhorn",
    Description = "Apply Aggro modifier to the next 2 summoned enemies.",
    Icon = 78401209212509,
    Cost = 400,
    Cooldown = 50,
    PreGameCooldown = 60,
    RequiresCursor = false,
    SingleUse = false,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}