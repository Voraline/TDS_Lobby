-- Script path: ReplicatedStorage.Content.Crate.Banned
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Banned!",
    Animation = 12481844920,
    MasterSound = 108223804753295,
    MusicName = "2025 Halloween Live Event",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Default,
    Preview = {
        Time = 3,
        FieldOfView = 20,
        Icon = 130085105177760,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Banned = {"Scout", "Electroshocker", "Trapper", "Brawler", "Ranger", "Pyromancer"}},
}