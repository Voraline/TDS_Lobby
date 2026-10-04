-- Script path: ReplicatedStorage.Content.Crate.Scuba Ops
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Dive deep and double check your oxygen levels!",
    Animation = 73688056742869,
    MasterSound = 89573219782438,
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Event,
    Preview = {
        Time = 3,
        FieldOfView = 20,
        Icon = 0,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {
        {Value = 4500, Type = Enum.CurrencyType.Coins},
        {Id = 3607787277, Type = Enum.CurrencyType.Robux},
    },
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 4500,
                [Enum.SkinRarity.Uncommon] = 5250,
                [Enum.SkinRarity.Rare] = 6500,
                [Enum.SkinRarity.Legendary] = 10000,
            },
        },
    },
    Contents = {["Scuba Ops"] = {"Hunter", "Brawler", "Pyromancer", "Engineer", "Shotgunner"}},
}