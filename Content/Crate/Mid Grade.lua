-- Script path: ReplicatedStorage.Content.Crate.Mid Grade
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A mid-grade consumable crate, for those who need a little more punch!",
    Animation = 5177813223,
    Category = Enum.CrateCategory.Consumables,
    Price = {Value = 750, Type = Enum.CurrencyType.Coins},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 18443277106,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Consumables = {
        Amount = 6,
        Rarities = {
            [Enum.ConsumableRarity.Common] = 0.3,
            [Enum.ConsumableRarity.Uncommon] = 0.375,
            [Enum.ConsumableRarity.Rare] = 0.2,
            [Enum.ConsumableRarity.Epic] = 0.1,
            [Enum.ConsumableRarity.Legendary] = 0.025,
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