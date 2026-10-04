-- Script path: ReplicatedStorage.Content.Consumables.UAV.Data
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "UAV",
    Description = "Gives all towers hidden and flight detection. Also increases the range of each tower by 30%.",
    Icon = 17448597451,
    RequiresCursor = false,
    MaxUses = 4,
    Cooldown = 50,
    PreGameCooldown = 40,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Uncommon,
    Price = {Value = 50, Type = Enum.CurrencyType.Coins},
    QueueType = Enum.ConsumableQueue.Global,
}