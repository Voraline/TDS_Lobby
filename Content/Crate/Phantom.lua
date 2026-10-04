-- Script path: ReplicatedStorage.Content.Crate.Phantom
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The world's deadliest mercenaries are available for hire!.. for a hefty price!",
    Animation = 15686451319,
    MasterSound = 15689195168,
    MusicName = "Metaverse",
    Category = Enum.CrateCategory.Robux,
    Rarity = Enum.SkinRarity.Legendary,
    Price = {Id = 1708992019, Value = 200, Type = Enum.CurrencyType.Robux},
    Preview = {
        Time = 0.866,
        FieldOfView = 20,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Daily = {
        CurrencyType = Enum.CurrencyType.Robux,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 3709097829,
                [Enum.SkinRarity.Uncommon] = 3709099203,
                [Enum.SkinRarity.Rare] = 3709099092,
                [Enum.SkinRarity.Legendary] = 3709098616,
            },
        },
    },
    Contents = {
        Phantom = {
            "Minigunner",
            "Sledger",
            "Ranger",
            "Commander",
            "Gladiator",
            "Shotgunner",
            "Engineer",
            "Scout",
            "Toxic Gunner",
        },
    },
}