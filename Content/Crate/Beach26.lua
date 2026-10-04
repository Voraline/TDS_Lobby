-- Script path: ReplicatedStorage.Content.Crate.Beach26
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "I don't like the sand...",
    DisplayName = "Beach",
    Animation = 132816989353207,
    MasterSound = 106238927215204,
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Event,
    Price = {
        {Value = 4500, Type = Enum.CurrencyType.Coins},
        {Id = 3607787252, Type = Enum.CurrencyType.Robux},
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
    Preview = {
        Time = 2,
        FieldOfView = 20,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Abyssal = {"EvolvedEnforcer"},
        Aquatic = {"Ranger"},
        Axolotl = {"Ranger"},
        Anemone = {"Slime Trooper"},
        Beach = {
            "Accelerator",
            "Electroshocker",
            "Medic",
            "Ranger",
            "Brawler",
            "Soldier",
            "Rocketeer",
            "Mortar",
            "Demoman",
        },
        ["Coconut Lover"] = {"Trapper"},
        ["Coral Princess"] = {"Saboteur"},
        ["Ice Cream"] = {"Military Base"},
        ["Pool Day"] = {"Hacker", "Crook Boss"},
        ["Popsicle Vendor"] = {"Farm"},
        Seal = {"Commander"},
        ["Surfs Up"] = {"Warlock"},
    },
}