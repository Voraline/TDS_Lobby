-- Script path: ReplicatedStorage.Content.Crate.Valentines 2026
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Love to all! <3",
    Animation = 120829054517056,
    Category = Enum.CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {Value = 4500, Type = Enum.CurrencyType.Coins},
    Contents = {
        Valentines = {"Mortar", "Scout", "Sniper", "Soldier", "Cowboy", "Commander"},
        Chocolatier = {"Elf Camp", "Trapper", "Minigunner", "Militant"},
        ["Second Chance"] = {"Medic"},
        Lovestriker = {"Electroshocker"},
        Cupid = {"Crook Boss", "Accelerator"},
        Heartbreak = {"Engineer"},
    },
    Sounds = {Drop = 120247581469654},
}