-- Script path: ReplicatedStorage.Content.Nametag.Basic.Pig
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Pig",
    Description = "Oink!",
    Rarity = Enum.SkinRarity.Rare,
    Price = {Value = 2000, Type = Enum.CurrencyType.Coins},
}