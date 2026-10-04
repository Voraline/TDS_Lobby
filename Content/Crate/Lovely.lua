-- Script path: ReplicatedStorage.Content.Crate.Lovely
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "XOXO -Paradoxum Games",
    Animation = 12481037656,
    Category = Enum.CrateCategory.Default,
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
    Preview = {
        Time = 3,
        FieldOfView = 30,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0.17453292519943295, 0),
    },
    Contents = {
        Valentines = {"Commander", "Sniper", "Scout", "Soldier", "Cowboy"},
        Heartbreak = {"Engineer"},
        Chocolatier = {"Militant"},
        Cupid = {"Crook Boss", "Accelerator"},
    },
    Sounds = {Drop = 5446304208, Open = 5446304444, Fling = 5446304771, Unlock = 5446303907},
}