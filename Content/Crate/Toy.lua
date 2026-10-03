-- Script path: ReplicatedStorage.Content.Crate.Toy
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Who knew cheap plastic and toy blasters could be so deadly?",
    Animation = 5177813223,
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Uncommon,
    Price = {Value = 850, Type = Enum.CurrencyType.Coins},
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 850,
                [Enum.SkinRarity.Uncommon] = 1000,
                [Enum.SkinRarity.Rare] = 99999,
                [Enum.SkinRarity.Legendary] = 99999,
            },
        },
    },
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 4771364114,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Toy = {"Minigunner", "Rocketeer", "Soldier"}},
    Sounds = {Open = 5446308360, Drop = 5446308679, Tape = 5446309124},
}