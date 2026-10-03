-- Script path: ReplicatedStorage.Shared.Modules.RarityColors
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local v1 = {}
v1[Enum.SkinRarity.Common] = (Color3.fromRGB(162, 162, 162))
v1[Enum.SkinRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
v1[Enum.SkinRarity.Rare] = (Color3.fromRGB(0, 170, 255))
v1[Enum.SkinRarity.Legendary] = (Color3.fromRGB(170, 85, 255))
v1[Enum.SkinRarity.Golden] = (Color3.fromRGB(255, 223, 0))
v1[Enum.SkinRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
v1[Enum.SkinRarity.Event] = (Color3.fromRGB(255, 0, 0))
v1[Enum.SkinRarity.Ultimate] = (Color3.fromRGB(255, 67, 174))
v1[Enum.SkinRarity.Developer] = (Color3.fromRGB(0, 255, 255))
v1[Enum.SkinRarity.Utility] = (Color3.fromRGB(252, 129, 13))
return v1