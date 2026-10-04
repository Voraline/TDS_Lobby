-- Script path: ReplicatedStorage.Content.Consumables.Graveyard.Data
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Graveyard",
    Description = "Place a graveyard on the enemy's path. It spawns normal zombies for 5 seconds.",
    Icon = 125115827995656,
    Cost = 150,
    Cooldown = 30,
    PreGameCooldown = 50,
    RequiresCursor = true,
    LockedToPath = true,
    SingleUse = false,
    PlacementRadius = 25,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}