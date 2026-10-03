-- Script path: ReplicatedStorage.Content.Crate.Lunar
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Lunar New Year Skins!",
    Animation = 94994855827109,
    Category = Enum.CrateCategory.Default,
    Price = {Value = 5000, Type = Enum.CurrencyType.Coins},
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 5000,
                [Enum.SkinRarity.Uncommon] = 5000,
                [Enum.SkinRarity.Rare] = 5000,
                [Enum.SkinRarity.Legendary] = 5000,
                [Enum.SkinRarity.Golden] = 5000,
            },
        },
    },
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 9011713759,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Lunar = {"Harvester", "Rocketeer", "Hallow Punk"},
        Horse = {"Brawler"},
        Tiger = {"Warlock"},
        Ox = {"Minigunner"},
    },
    Sounds = {Main = 86213087575469},
}