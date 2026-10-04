-- Script path: ReplicatedStorage.Content.Crate.Ducky
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Quack! Duck skins introduced in the 2022 'Duck Hunting' season.",
    Animation = 13405544314,
    Category = Enum.CrateCategory.Default,
    Price = {Value = 3000, Type = Enum.CurrencyType.Coins},
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 3000,
                [Enum.SkinRarity.Uncommon] = 3500,
                [Enum.SkinRarity.Rare] = 4000,
                [Enum.SkinRarity.Legendary] = 4500,
            },
        },
    },
    Preview = {
        Time = 1.4,
        FieldOfView = 10,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Ducky = {
            "Scout",
            "Sniper",
            "Soldier",
            "Hunter",
            "Shotgunner",
            "Militant",
            "Minigunner",
            "Commander",
            "Farm",
            "Engineer",
            "Warden",
            "Accelerator",
            "Cowboy",
            "Electroshocker",
            "Mortar",
        },
    },
    Sounds = {Drop = 5446304208, Open = 5446304444, Quack = 5681935637},
}