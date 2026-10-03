-- Script path: ReplicatedStorage.Content.Crate.Spooky
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "What could be inside? A trick or a treat?",
    Animation = 5797449936,
    MusicName = "Spooky Crate",
    Category = (require(ReplicatedStorage.Shared.Modules.Enum)).CrateCategory.Event,
    Preview = {
        Time = 1,
        FieldOfView = 50,
        Icon = 5797457085,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Spooky = {"Crook Boss", "Slasher", "Archer"},
        Demon = {"Gladiator", "Crook Boss"},
        Graveyard = {"Farm"},
        Ghost = {"Minigunner", "Militant", "DJ Booth", "Pyromancer", "Commander", "Electroshocker"},
    },
    Sounds = {
        Drop = 5446304208,
        Open = 5446304444,
        Fling = 5446304771,
        Unlock = 5446303907,
        Crack = 131144461,
    },
}