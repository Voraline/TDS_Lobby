-- Script path: ReplicatedStorage.Content.Crate.Halloween 2019
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Happy Halloween 2019!",
    Animation = 113740454584031,
    MasterSound = 120177820890065,
    MusicName = "Basic Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5501301558,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Pumpkin = {"Minigunner", "Ace Pilot", "Gladiator", "Rocketeer", "Cowboy"},
        Demon = {"Gladiator", "Crook Boss"},
        Gargoyle = {"Commander"},
        Scarecrow = {"Pyromancer"},
    },
    Sounds = {Open = 5446308360, Drop = 5446308679, Tape = 5446309124},
}