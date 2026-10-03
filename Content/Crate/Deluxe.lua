-- Script path: ReplicatedStorage.Content.Crate.Deluxe
-- Decompile time: 2.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A deluxe skincrate used to unbox the highest quality skins.",
    Animation = 97489603937502,
    MasterSound = 72726963923739,
    MusicName = "Deluxe Crate",
    Category = Enum.CrateCategory.Robux,
    Rarity = Enum.SkinRarity.Legendary,
    Daily = {
        CurrencyType = Enum.CurrencyType.Robux,
        Prices = {
            Rarities = {
                [Enum.SkinRarity.Common] = 1346914696,
                [Enum.SkinRarity.Uncommon] = 1346914737,
                [Enum.SkinRarity.Rare] = 1346914768,
                [Enum.SkinRarity.Legendary] = 1346914794,
            },
        },
    },
    Price = {Id = 1110639180, Value = 200, Type = Enum.CurrencyType.Robux},
    Preview = {
        Time = 1.15,
        FieldOfView = 50,
        Icon = 5853271555,
        CameraOffset = CFrame.new(0, 0, 0),
        CrateRotation = CFrame.Angles(0, 0, 0),
    },
    Contents = {
        Loader = {"Brawler"},
        Patriotic = {"Commander"},
        Liberator = {"Mercenary Base"},
        Classic = {"Electroshocker"},
        Trucker = {"Minigunner"},
        ["Neon Rave"] = {"DJ Booth"},
        ["Gun Gale"] = {"Ranger"},
        Mage = {"Accelerator", "Necromancer"},
        Maid = {"Commander"},
        Tycoon = {"Farm"},
        Retired = {"Cowboy"},
        Noir = {"Cowboy"},
        Cyberpunk = {"Cowboy"},
        ["Ace Pilot"] = {"Militant"},
        Soviet = {"Crook Boss"},
        Neko = {"DJ Booth", "Commander"},
        Huntsman = {"Archer"},
        Galactic = {"Gladiator", "Warden"},
        ["Bounty Hunter"] = {"Cowboy"},
        Crypto = {"Farm"},
        Mechanic = {"Engineer"},
        ["Grand Theft"] = {"Soldier"},
        SteamPunk = {"Crook Boss"},
        ["Speaker Titan"] = {"Accelerator"},
        TeeVee = {"Electroshocker"},
        Cameraman = {"Gladiator"},
        Baseball = {"Mortar"},
        Cyber = {"Military Base"},
    },
    Sounds = {Drop = 5446304208, Open = 5446304444, Hatch = 4887735649, Lift = 4887735881},
}