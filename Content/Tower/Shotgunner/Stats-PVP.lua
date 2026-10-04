-- Script path: ReplicatedStorage.Content.Tower.Shotgunner.Stats-PVP
-- Decompile time: 2.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 5587697635,
                    Title = "Faster Reloading",
                    Cost = 150,
                    Stats = {
                        Cooldown = 1.5,
                        Damage = 1,
                        Range = 7.5,
                        Attributes = {Spread = 45, ShotSize = 8},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                },
                {
                    Image = 5587697884,
                    Title = "Shotgun Knowledge",
                    Cost = 1050,
                    Stats = {
                        Range = 9,
                        Cooldown = 1.5,
                        Damage = 2,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"10 Pellets", "Tighter Spread"},
                        Attributes = {ShotSize = 10, Spread = 40},
                    },
                },
                {
                    Image = 5587698104,
                    Title = "Slug Madness",
                    Cost = 3000,
                    Stats = {
                        Cooldown = 1.25,
                        Damage = 4,
                        Range = 9.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {Spread = 40, ShotSize = 10},
                    },
                },
                {
                    Image = 5587698246,
                    Title = "Tactical Blowback",
                    Cost = 8500,
                    Stats = {
                        Range = 11,
                        Cooldown = 1,
                        Damage = 8,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"12 Pellets", "Tighter Spread"},
                        Attributes = {ShotSize = 12, Spread = 30},
                    },
                },
            },
            Defaults = {
                Price = 400,
                Range = 7.5,
                Cooldown = 2,
                Damage = 1,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {ShotSize = 8, Spread = 45},
            },
        },
    },
    Properties = {
        Description = "Wields a powerful pump shotgun with small range. Pierces through enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 1,
        DPS_Display = {DPS = TowerDPS.Shotgun},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 1000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Classic = {Icon = 4863402918, Rarity = Enum.SkinRarity.Common},
            Spooky = {Icon = 4863402918, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4863402918, Rarity = Enum.SkinRarity.Uncommon},
            ["Hallow Punk"] = {Icon = 4863402918, Rarity = Enum.SkinRarity.Event},
            Holiday = {Icon = 4863434919, Rarity = Enum.SkinRarity.Event},
            Vigilante = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Phantom = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
            Slayer = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            ["Dance Fever"] = {Icon = 139385538174792, Rarity = Enum.SkinRarity.Uncommon},
            Gardener = {Icon = 98658379166107, Rarity = Enum.SkinRarity.Rare},
            Null = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 9391782332,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}