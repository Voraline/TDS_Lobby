-- Script path: ReplicatedStorage.Content.Crate.Golden
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Special skins for: Minigunner, Cowboy, Crook Boss, Pyro, Scout, Soldier, Demoman.",
    Animation = 78327654609882,
    MasterSound = 82760830261614,
    MusicName = "Golden Crate",
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Golden,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Skins = {
                Minigunner = 75000,
                Pyromancer = 65000,
                Scout = 55000,
                ["Crook Boss"] = 55000,
                Soldier = 50000,
                Cowboy = 70000,
                Demoman = 55000,
            },
        },
    },
    Weights = {
        [Enum.SkinRarity.Common] = 1,
        [Enum.SkinRarity.Uncommon] = 2,
        [Enum.SkinRarity.Rare] = 3,
        [Enum.SkinRarity.Legendary] = 4,
    },
    Price = {Value = 50000, Type = Enum.CurrencyType.Coins},
    Preview = {
        Time = 1.8,
        FieldOfView = 50,
        Icon = 5177999683,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Golden = {"Minigunner", "Pyromancer", "Scout", "Crook Boss", "Soldier", "Cowboy", "Demoman"}},
    Sounds = {
        Beep = 5446307048,
        Drop = 5446305762,
        Open = 5446306077,
        Insert = 5446306728,
        Charge = 5446306431,
    },
}