-- Script path: ReplicatedStorage.Content.Crate.Valentines
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "With extra love! <3 (Legacy Skins)",
    Animation = 113740454584031,
    MasterSound = 120177820890065,
    MusicName = "Basic Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5501324337,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Valentines = {"Pyromancer", "Ranger", "Electroshocker", "Archer"}},
    Sounds = {Open = 5446308360, Drop = 5446308679, Tape = 5446309124},
}