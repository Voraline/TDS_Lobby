-- Script path: ReplicatedStorage.Content.Crate.Patriotic
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "What's a kilometer?",
    MasterSound = 80320707376170,
    Animation = 116262436930382,
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Event,
    Preview = {
        Time = 3,
        FieldOfView = 50,
        Icon = 70986816701531,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {
        {Value = 4500, Type = Enum.CurrencyType.Coins},
        {Id = 3607787160, Type = Enum.CurrencyType.Robux},
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
    Contents = {
        Patriotic = {"Warden", "Cowboy", "Soldier", "Pursuit", "Commander"},
        ["Base 1776"] = {"Military Base"},
    },
}