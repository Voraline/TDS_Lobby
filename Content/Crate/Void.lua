-- Script path: ReplicatedStorage.Content.Crate.Void
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Event skins for those who live in Hardcore mode. Unbox tactical looks for your roster!",
    MasterSound = 77222845514186,
    Animation = 71505417278309,
    Category = Enum.CrateCategory.Default,
    Rarity = Enum.SkinRarity.Rare,
    Preview = {
        Time = 3,
        FieldOfView = 50,
        Icon = 18443277106,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {Value = 1000, Type = Enum.CurrencyType.Gems},
    Contents = {
        ["Void Altar"] = {"Farm"},
        Voidborne = {"Tesla"},
        Void = {"Accelerator", "Trapper"},
        Amalgamation = {"Warden"},
    },
}