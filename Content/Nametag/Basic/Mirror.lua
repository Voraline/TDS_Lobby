-- Script path: ReplicatedStorage.Content.Nametag.Basic.Mirror
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Mirror",
    Description = "A relection",
    Rarity = Enum.SkinRarity.Uncommon,
    Price = {Value = 1000, Type = Enum.CurrencyType.Coins},
}