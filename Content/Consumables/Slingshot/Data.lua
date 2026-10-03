-- Script path: ReplicatedStorage.Content.Consumables.Slingshot.Data
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Slingshot",
    Description = "Deal 10 direct damage to opponent team's health.",
    Icon = 140044103869004,
    Cost = 1000,
    Cooldown = 75,
    PreGameCooldown = 45,
    RequiresCursor = false,
    SingleUse = false,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}