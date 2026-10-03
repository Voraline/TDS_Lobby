-- Script path: ReplicatedStorage.Content.Crate.Holiday Crate
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "2024 Winter Consumable Crate",
    Animation = 5177813223,
    Icon = 134421854377930,
    Category = Enum.CrateCategory.Consumables,
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Consumables = {
        Amount = 5,
        Rarities = {
            [Enum.ConsumableRarity.Common] = 0.315,
            [Enum.ConsumableRarity.Uncommon] = 0.375,
            [Enum.ConsumableRarity.Rare] = 0.2,
            [Enum.ConsumableRarity.Epic] = 0.1,
            [Enum.ConsumableRarity.Legendary] = 0.01,
        },
        Items = {
            "Festive Tree",
            "Fruit Cake",
            "Santa’s Air Strike",
            "Present Cluster Bomb",
            "Molten Monster",
            "Blizzard Bomb",
        },
    },
}