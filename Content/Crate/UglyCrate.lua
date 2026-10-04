-- Script path: ReplicatedStorage.Content.Crate.UglyCrate
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "april fools!",
    Animation = 107931172800446,
    Category = Enum.CrateCategory.Default,
    Price = {Value = 1, Type = Enum.CurrencyType.Coins},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 9011713759,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {PNG = {"Farm"}},
    Sounds = {Unbox = 91688977116039},
}