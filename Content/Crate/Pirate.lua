-- Script path: ReplicatedStorage.Content.Crate.Pirate
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "🏴‍☠️ Arghhhhhhh! ",
    Animation = 14317097315,
    Category = Enum.CrateCategory.Default,
    Price = {Value = 3500, Type = Enum.CurrencyType.Coins},
    Rarity = Enum.SkinRarity.Rare,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 3500,
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
        Pirate = {
            "Demoman",
            "Commando",
            "Commander",
            "Farm",
            "Mortar",
            "Hunter",
            "Crook Boss",
            "Warden",
            "Gladiator",
            "EvolvedOperator",
            "Militant",
            "Military Base",
            "Spotlight Tech",
            "Slasher",
        },
        Tiderunner = {"Rocketeer"},
        Eyecatcher = {"Warlock"},
    },
    Sounds = {Unbox = 14317111185},
}