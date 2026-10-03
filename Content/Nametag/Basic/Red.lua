-- Script path: ReplicatedStorage.Content.Nametag.Basic.Red
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Red",
    Description = "Red nametag",
    Rarity = Enum.SkinRarity.Common,
    Price = {Value = 500, Type = Enum.CurrencyType.Coins},
}