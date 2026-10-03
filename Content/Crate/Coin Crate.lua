-- Script path: ReplicatedStorage.Content.Crate.Coin Crate
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "description goes here",
    Animation = 118228225564291,
    Category = Enum.CrateCategory.Default,
    Price = {Value = 101, Id = 3254385585, Type = Enum.CurrencyType.Robux},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 9011713759,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {["Alien Focus"] = {"Crook Boss"}, ["The Flea"] = {"Jester"}, ["The Beast"] = {"Jester"}},
    Sounds = {Unbox = 139411891713412},
}