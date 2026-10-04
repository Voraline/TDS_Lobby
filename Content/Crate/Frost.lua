-- Script path: ReplicatedStorage.Content.Crate.Frost
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "A chilling wind creeps into the room.",
    Animation = 6778622480,
    MusicName = "Frost Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 6778699919,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Frost = {"Minigunner", "Pyromancer", "Commander", "Ranger", "Mortar"}},
    Sounds = {Drop = 5446304208, Open = 5446304444, Unlock = 5446303907},
}