-- Script path: ReplicatedStorage.Content.Crate.Lovestruck
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "2025 Valentines Skins",
    Animation = 97618713408812,
    Category = Enum.CrateCategory.Event,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 4000,
                [Enum.SkinRarity.Uncommon] = 4500,
                [Enum.SkinRarity.Rare] = 5500,
                [Enum.SkinRarity.Legendary] = 7000,
            },
        },
    },
    Weights = {
        [Enum.SkinRarity.Uncommon] = 3,
        [Enum.SkinRarity.Rare] = 1.5,
        [Enum.SkinRarity.Legendary] = 0.5,
    },
    Preview = {
        Time = 2.12,
        FieldOfView = 50,
        Icon = 9011713759,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Lovestriker = {"Rocketeer", "Brawler"},
        Chocolatier = {"Sledger", "Militant"},
        Heartbreak = {"Engineer", "Jester", "Executioner"},
        Valentines = {"Commander", "Sniper", "Scout", "Soldier", "Cowboy", "Archer", "Ranger", "Electroshocker"},
        Cupid = {"Crook Boss", "Accelerator"},
    },
    Sounds = {Unbox = 83143085217525},
}