-- Script path: ReplicatedStorage.Content.Crate.Basic
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A common skincrate used to unbox very basic skins.",
    Animation = 113740454584031,
    MasterSound = 120177820890065,
    MusicName = "Basic Crate",
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Common,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 500,
                [Enum.SkinRarity.Uncommon] = 750,
                [Enum.SkinRarity.Rare] = 1000,
                [Enum.SkinRarity.Legendary] = 99999,
                [Enum.SkinRarity.Golden] = 99999,
            },
        },
    },
    Price = {Value = 500, Type = Enum.CurrencyType.Coins},
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5177997959,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Military = {"Demoman"},
        Navy = {"Ace Pilot", "Accelerator"},
        Blue = {
            "Minigunner",
            "Pyromancer",
            "Ranger",
            "Hunter",
            "Scout",
            "Crook Boss",
            "Sniper",
            "Demoman",
            "Soldier",
        },
        Purple = {"Ace Pilot"},
        Survivor = {"Scout"},
        Green = {"Minigunner", "Commander", "Ace Pilot", "Ranger", "Scout", "Demoman"},
        Ghillie = {"Sniper"},
        Yellow = {"Ace Pilot", "Demoman"},
        ["Aerial Ace"] = {"Ace Pilot"},
        Red = {
            "Commander",
            "Paintballer",
            "Ace Pilot",
            "Scout",
            "Crook Boss",
            "Sniper",
            "Soldier",
            "Accelerator",
            "Demoman",
        },
    },
    Sounds = {Open = 5446308360, Drop = 5446308679, Tape = 5446309124},
}