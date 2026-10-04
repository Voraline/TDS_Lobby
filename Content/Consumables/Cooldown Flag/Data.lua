-- Script path: ReplicatedStorage.Content.Consumables.Cooldown Flag.Data
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Fire Rate Flag",
    Description = "Provides an AOE that boosts tower fire rate by 20% for 45 seconds. (Does not stack with other fire rate flags)",
    Icon = 17438487774,
    RequiresCursor = true,
    CursorSize = 40,
    Cooldown = 60,
    PreGameCooldown = 45,
    MaxUses = 3,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Rare,
    QueueType = Enum.ConsumableQueue.None,
}