-- Script path: ReplicatedStorage.Content.Tower.Militant.Stats-PVP
-- Decompile time: 1.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 5523212631,
                    Title = "Radio Comms",
                    Cost = 600,
                    Stats = {
                        Range = 17,
                        Cooldown = 0.15,
                        Damage = 2,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                        },
                    },
                },
                {
                    Image = 5523215135,
                    Title = "Bigger Rifle",
                    Cost = 2600,
                    Stats = {Cooldown = 0.1, Range = 17, Damage = 2},
                },
                {
                    Image = 5523216332,
                    Title = "Upskill",
                    Cost = 5000,
                    Stats = {Range = 20, Cooldown = 0.1, Damage = 5},
                },
                {
                    Image = 5523217773,
                    Title = "Stealth Mercenary",
                    Cost = 10000,
                    Stats = {Range = 20, Cooldown = 0.1, Damage = 10},
                },
            },
            Defaults = {
                Price = 1400,
                Range = 15,
                Cooldown = 0.2,
                Damage = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
            },
        },
    },
    Properties = {
        Description = "Trained with an assault rifle, this tower deals medium damage at a fast firerate.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 500, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            ["Ace Pilot"] = {Icon = 3958831177, Rarity = Enum.SkinRarity.Rare},
            Hazmat = {Icon = 3958831177, Rarity = Enum.SkinRarity.Common},
            John = {Icon = 3958831177, Rarity = Enum.SkinRarity.Exclusive},
            Ghost = {Icon = 3958831177, Rarity = Enum.SkinRarity.Event},
            Pumpkin = {Icon = 3958831177, Rarity = Enum.SkinRarity.Event},
            Chocolatier = {Icon = 3958831177, Rarity = Enum.SkinRarity.Uncommon},
            Ducky = {Icon = 3958831177, Rarity = Enum.SkinRarity.Uncommon},
            Beach = {Icon = 3958831177, Rarity = Enum.SkinRarity.Event},
            Lumberjack = {Icon = 3958831177, Rarity = Enum.SkinRarity.Uncommon},
            Davinchi = {Icon = 3958831177, Rarity = Enum.SkinRarity.Event},
            Arsenal = {Icon = 3958831177, Rarity = Enum.SkinRarity.Exclusive},
            Fallen = {Icon = 18835926439, Rarity = Enum.SkinRarity.Rare},
            ["Star Spartan"] = {Icon = 76196766882530, Rarity = Enum.SkinRarity.Rare},
            Wasteland = {Icon = 140245000984082, Rarity = Enum.SkinRarity.Rare},
            Easter = {Icon = 86436209069316, Rarity = Enum.SkinRarity.Rare},
            Acheron = {Icon = 114000424593798, Rarity = Enum.SkinRarity.Uncommon},
            Undead = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 9391813225,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}