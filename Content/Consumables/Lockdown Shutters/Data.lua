-- Script path: ReplicatedStorage.Content.Consumables.Lockdown Shutters.Data
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Lockdown Shutters",
    Description = "Place lockdown shutters on your team's path and become immune to damage for 2 seconds.",
    Icon = 90821033529022,
    Cost = 750,
    Cooldown = 30,
    PreGameCooldown = 60,
    RequiresCursor = true,
    LockedToPath = true,
    PlacementRadius = 25,
    PVPUsedOnOwnTeam = true,
    SingleUse = false,
    PVP = true,
    Rarity = Enum.ConsumableRarity.Common,
    QueueType = Enum.ConsumableQueue.PerPlayer,
}