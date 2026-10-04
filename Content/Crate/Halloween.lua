-- Script path: ReplicatedStorage.Content.Crate.Halloween
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Happy Halloween!",
    Animation = 12481037656,
    Category = Enum.CrateCategory.Event,
    Weights = {
        [Enum.SkinRarity.Common] = 1,
        [Enum.SkinRarity.Uncommon] = 2,
        [Enum.SkinRarity.Rare] = 3,
        [Enum.SkinRarity.Legendary] = 4,
        [Enum.SkinRarity.Exclusive] = 5,
    },
    Preview = {
        Time = 3,
        FieldOfView = 30,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0.17453292519943295, 0),
    },
    Contents = {
        Necromancer = {"Crook Boss"},
        ["Skull Trooper"] = {"Scout"},
        ["Ghost Buster"] = {"Accelerator"},
        Ghost = {"Minigunner"},
        Halloween = {"Hunter"},
        Graveyard = {"Farm"},
        ["Hallow Punk"] = {"Shotgunner"},
        Pumpkin = {"Cowboy", "Minigunner", "Demoman", "Ranger"},
        Crusader = {"Minigunner"},
    },
    Sounds = {Drop = 5446304208, Open = 5446304444, Fling = 5446304771, Unlock = 5446303907},
}