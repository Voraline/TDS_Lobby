-- Script path: ReplicatedStorage.Content.Crate.Shamrock
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Happy St. Patrick's Day! May the luck of the Irish be with you!",
    Animation = 130607026140311,
    Category = Enum.CrateCategory.Event,
    Preview = {
        Time = 1.5,
        FieldOfView = 50,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {Value = 5000, Type = Enum.CurrencyType.Coins},
    Contents = {
        Shamrock = {"Warden", "Medic", "Cowboy"},
        ["Pot Of Gold"] = {"Farm"},
        Leprechaun = {"Rocketeer"},
        Springtime = {"Engineer"},
        ["Spring Time"] = {"Slasher", "Commander"},
    },
    Sounds = {Drop = 94898428288028},
}