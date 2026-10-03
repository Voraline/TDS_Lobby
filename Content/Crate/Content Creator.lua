-- Script path: ReplicatedStorage.Content.Crate.Content Creator
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "All Content Creators!",
    Animation = 5177813223,
    DailyOnly = true,
    Category = Enum.CrateCategory.Default,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 3000,
                [Enum.SkinRarity.Uncommon] = 3000,
                [Enum.SkinRarity.Rare] = 3000,
                [Enum.SkinRarity.Legendary] = 4500,
                [Enum.SkinRarity.Event] = 4500,
                [Enum.SkinRarity.Exclusive] = 4500,
            },
            Skins = {Jordan = 3232},
        },
    },
    Weights = {
        [Enum.SkinRarity.Common] = 1,
        [Enum.SkinRarity.Uncommon] = 1,
        [Enum.SkinRarity.Rare] = 1,
        [Enum.SkinRarity.Legendary] = 1,
        [Enum.SkinRarity.Exclusive] = 1,
        [Enum.SkinRarity.Exclusive] = 1,
    },
    Preview = {
        Time = 3,
        FieldOfView = 30,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0.17453292519943295, 0),
    },
    Contents = {
        Megalodon = {"Cowboy"},
        Corso = {"Crook Boss"},
        Eggrypted = {"Commander"},
        Wikia = {"Engineer"},
        Propellars = {"Ranger"},
        Sweaking = {"Minigunner"},
        Elite = {"Accelerator"},
        Isaac = {"Warden"},
        Dank = {"Accelerator"},
        ["5ouls"] = {"Ranger"},
        DraxRex = {"Engineer"},
        Jordan = {"Brawler"},
    },
}