-- Script path: ReplicatedStorage.Content.Consumables.Damage Flag.Data
-- Decompile time: 0.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Damage Flag",
    Description = "Provides an AOE that boosts tower damage by 20% for 45 seconds. (Does not stack with other damage flags)",
    Icon = 17438486138,
    Cooldown = 60,
    PreGameCooldown = 45,
    RequiresCursor = true,
    CursorSize = 40,
    MaxUses = 3,
    SingleUse = true,
    Rarity = Enum.ConsumableRarity.Rare,
    QueueType = Enum.ConsumableQueue.None,
}