-- Script path: ReplicatedStorage.Content.Crate.Pumpkin
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Ahahahaha... HAPPY HALLOWEEN!",
    Animation = 5797449936,
    MusicName = "Pumpkin Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5902698900,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {Pumpkin = {"Minigunner", "Ace Pilot", "Gladiator", "Rocketeer", "Cowboy"}},
    Sounds = {
        Drop = 5446304208,
        Open = 5446304444,
        Fling = 5446304771,
        Unlock = 5446303907,
        Crack = 131144461,
    },
}