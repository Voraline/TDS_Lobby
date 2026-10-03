-- Script path: ReplicatedStorage.Content.Crate.Star Wars
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "May the 4th be with you.",
    Animation = 97489603937502,
    DailyOnly = true,
    Category = Enum.CrateCategory.Default,
    Daily = {
        CurrencyType = Enum.CurrencyType.Coins,
        Prices = {
            Rarities = {[Enum.SkinRarity.Rare] = 3000, [Enum.SkinRarity.Legendary] = 5000},
        },
    },
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 5853271555,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Senator = {"Accelerator"}, Vanquisher = {"Executioner"}},
}