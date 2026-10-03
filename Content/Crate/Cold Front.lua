-- Script path: ReplicatedStorage.Content.Crate.Cold Front
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Special delivery from the Arctic! (Skins by MidnightKrystal)",
    Animation = 12481844920,
    MusicName = "Frost Crate",
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Rare,
    Price = {Value = 3000, Type = Enum.CurrencyType.Coins},
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 3000,
                [Enum.SkinRarity.Uncommon] = 3500,
                [Enum.SkinRarity.Rare] = 4250,
                [Enum.SkinRarity.Legendary] = 6000,
            },
        },
    },
    Preview = {
        Time = 3,
        FieldOfView = 20,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Stranded = {"Medic"},
        Silent = {"Sniper"},
        Brisk = {"Commander"},
        ["Frost Hunter"] = {"Scout"},
        ["Brave Soul"] = {"Sledger"},
        ["Ice Witch"] = {"Accelerator"},
    },
    Sounds = {
        Drop = 5446304208,
        Open = 5446304444,
        Click = 9119720940,
        Thump = 5645906305,
        Unlock = 5446303907,
    },
}