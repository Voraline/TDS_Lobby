-- Script path: ReplicatedStorage.Content.Nametag.Basic.Sunset
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Sunset",
    Description = "Sunset nametag",
    Rarity = Enum.SkinRarity.Rare,
    Price = {Value = 2000, Type = Enum.CurrencyType.Coins},
}