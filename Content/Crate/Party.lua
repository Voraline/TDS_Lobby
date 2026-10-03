-- Script path: ReplicatedStorage.Content.Crate.Party
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "A time of celebration!",
    Animation = 113740454584031,
    MasterSound = 120177820890065,
    MusicName = "Basic Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5501380355,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Party = {"Minigunner", "Scout", "Soldier"}},
    Sounds = {Open = 5446308360, Drop = 5446308679, Tape = 5446309124},
}