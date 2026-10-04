-- Script path: ReplicatedStorage.Content.Nametag.Basic.Blue
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Name = "Blue",
    Description = "Blue nametag",
    Rarity = Enum.SkinRarity.Common,
    Price = {Value = 500, Type = Enum.CurrencyType.Coins},
}