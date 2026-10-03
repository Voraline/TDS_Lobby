-- Script path: ReplicatedStorage.Content.Nametag.Basic.Purple
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Purple",
    Description = "Purple nametag",
    Rarity = Enum.SkinRarity.Uncommon,
    Price = {Value = 1000, Type = Enum.CurrencyType.Coins},
}