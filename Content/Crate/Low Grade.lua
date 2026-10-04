-- Script path: ReplicatedStorage.Content.Crate.Low Grade
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A low-grade consumable crate, perfect for restocking your inventory!",
    Animation = 5177813223,
    Category = Enum.CrateCategory.Consumables,
    Price = {Value = 300, Type = Enum.CurrencyType.Coins},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 18443277308,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Consumables = {
        Amount = 4,
        Rarities = {
            [Enum.ConsumableRarity.Common] = 0.6,
            [Enum.ConsumableRarity.Uncommon] = 0.25,
            [Enum.ConsumableRarity.Rare] = 0.1,
            [Enum.ConsumableRarity.Epic] = 0.04,
            [Enum.ConsumableRarity.Legendary] = 0.01,
        },
        Items = {
            "AirStrike",
            "Barricade",
            "Blizzard Bomb",
            "Cooldown Flag",
            "Damage Flag",
            "Range Flag",
            "Flash Bang",
            "Grenade",
            "Molotov",
            "Napalm Strike",
            "Nuke",
            "Supply Drop",
            "UAV",
            "Pumpkin Bomb",
            "Turkey Leg",
            "Sugar Rush",
            "Unholy Storm",
            "Necromancer's Tome",
        },
    },
}