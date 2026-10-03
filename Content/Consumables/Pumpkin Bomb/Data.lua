-- Script path: ReplicatedStorage.Content.Consumables.Pumpkin Bomb.Data
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Pumpkin Bomb",
    Description = "A Pumpkin Bomb possessed with either a helpful or mischevious spirit. Applies either a buff or debuff to enemies.",
    Icon = 124568805305441,
    Cooldown = 5,
    PreGameCooldown = 10,
    RequiresCursor = true,
    CursorSize = 10,
    MaxUses = 5,
    SingleUse = false,
    Rarity = Enum.ConsumableRarity.Epic,
    QueueType = Enum.ConsumableQueue.None,
}