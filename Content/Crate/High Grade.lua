-- Script path: ReplicatedStorage.Content.Crate.High Grade
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A high-grade consumable crate, HANDLE WITH CAUTION!",
    Animation = 5177813223,
    Category = Enum.CrateCategory.Consumables,
    Price = {Id = 1826105274, Value = 50, Type = Enum.CurrencyType.Robux},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 18443277591,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Consumables = {
        Amount = 8,
        Rarities = {
            [Enum.ConsumableRarity.Common] = 0,
            [Enum.ConsumableRarity.Uncommon] = 0,
            [Enum.ConsumableRarity.Rare] = 0.65,
            [Enum.ConsumableRarity.Epic] = 0.3,
            [Enum.ConsumableRarity.Legendary] = 0.05,
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