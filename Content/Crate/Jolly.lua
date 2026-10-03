-- Script path: ReplicatedStorage.Content.Crate.Jolly
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Happy Holidays!",
    Animation = 12481037656,
    MusicName = "Winter 2020",
    Category = Enum.CrateCategory.Event,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 5000,
                [Enum.SkinRarity.Uncommon] = 5000,
                [Enum.SkinRarity.Rare] = 5000,
                [Enum.SkinRarity.Legendary] = 5000,
                [Enum.SkinRarity.Event] = 5000,
                [Enum.SkinRarity.Exclusive] = 5000,
            },
        },
    },
    Weights = {
        [Enum.SkinRarity.Common] = 1,
        [Enum.SkinRarity.Uncommon] = 2,
        [Enum.SkinRarity.Rare] = 3,
        [Enum.SkinRarity.Legendary] = 4,
        [Enum.SkinRarity.Exclusive] = 5,
        [Enum.SkinRarity.Exclusive] = 6,
    },
    Preview = {
        Time = 3,
        FieldOfView = 30,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0.17453292519943295, 0),
    },
    Contents = {
        Holiday = {
            "Scout",
            "Soldier",
            "Shotgunner",
            "Crook Boss",
            "Cowboy",
            "Minigunner",
            "Commander",
            "Engineer",
        },
        Xmas = {"Minigunner", "Farm"},
    },
    Sounds = {Drop = 5446304208, Open = 5446304444, Fling = 5446304771, Unlock = 5446303907},
}