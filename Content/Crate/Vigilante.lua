-- Script path: ReplicatedStorage.Content.Crate.Vigilante
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Bring justice to Cyber City!",
    Animation = 13840936181,
    MusicName = "Vigilante Crate",
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Rare,
    Price = {Value = 3500, Type = Enum.CurrencyType.Coins},
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 99999,
                [Enum.SkinRarity.Uncommon] = 4000,
                [Enum.SkinRarity.Rare] = 5000,
                [Enum.SkinRarity.Legendary] = 7000,
            },
        },
    },
    Preview = {
        Time = 2,
        FieldOfView = 20,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Vigilante = {
            "Accelerator",
            "Shotgunner",
            "Electroshocker",
            "Gladiator",
            "Pyromancer",
            "Mortar",
            "Commander",
        },
    },
    Sounds = {Score = 14317109714},
}