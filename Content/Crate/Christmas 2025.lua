-- Script path: ReplicatedStorage.Content.Crate.Christmas 2025
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Merry Christmas 2025!",
    Animation = 106847929038450,
    MasterSound = 72497732438588,
    MusicName = "Winter 2020",
    Category = Enum.CrateCategory.Event,
    Preview = {
        Time = 3,
        FieldOfView = 40,
        Icon = 130085105177760,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {Id = 3483496487, Value = 199, Type = Enum.CurrencyType.Robux},
    Contents = {
        ["Candy Cane"] = {"Commander"},
        ["Jolly Tree"] = {"Trapper"},
        ["Ice Soul"] = {"Archer"},
        Elf = {"Archer"},
        Festive = {"Mortar"},
        Xmas = {"Farm", "Rocketeer", "Minigunner", "Crook Boss"},
        Holiday = {"Commander", "Engineer", "Shotgunner"},
        Classic = {"Elf Camp"},
    },
}