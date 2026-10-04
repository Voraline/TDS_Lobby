-- Script path: ReplicatedStorage.Content.Nametag.Basic.Inverted
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Inverted",
    Description = "Inverted nametag",
    Rarity = Enum.SkinRarity.Rare,
    Price = {Value = 2000, Type = Enum.CurrencyType.Coins},
}