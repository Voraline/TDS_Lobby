-- Script path: ReplicatedStorage.Content.Crate.Showtime
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "It's showtime!",
    Animation = 135214947460200,
    MasterSound = 107001751223997,
    MusicName = "2025_Phase1",
    Category = Enum.CrateCategory.Default,
    Preview = {
        Time = 3,
        FieldOfView = 40,
        Icon = 130085105177760,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Price = {Id = 3483496245, Value = 199, Type = Enum.CurrencyType.Robux},
    Contents = {
        Actor = {"Assassin"},
        Cinema = {"Farm"},
        Inventor = {"Firework Technician"},
        Rockstar = {"Warlock"},
        Director = {"Commander"},
        Bartender = {"Medic"},
        ["Fire Breather"] = {"Pyromancer"},
        Magician = {"Accelerator"},
        Victorian = {"Crook Boss"},
        Trumpeter = {"Shotgunner"},
        Trombone = {"Rocketeer"},
        ["Camera Operator"] = {"Hacker"},
    },
}