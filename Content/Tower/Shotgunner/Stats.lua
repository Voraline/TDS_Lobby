-- Script path: ReplicatedStorage.Content.Tower.Shotgunner.Stats
-- Decompile time: 1.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 5587697884,
                    Title = "Shotgun Knowledge",
                    Cost = 750,
                    Stats = {
                        Cooldown = 1.1,
                        Damage = 3,
                        Range = 8,
                        Attributes = {ShotSize = 8, Spread = 5},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                },
                {
                    Image = 5587697635,
                    Title = "Clay Pigeon Training",
                    Cost = 1500,
                    Stats = {
                        Range = 9.5,
                        Cooldown = 0.8,
                        Damage = 3,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"8 > 9 Pellets", "Larger Spread (5 > 10)"},
                        Attributes = {ShotSize = 9, Spread = 10},
                    },
                },
                {
                    Image = 5587698104,
                    Title = "Heavier Shells",
                    Cost = 6500,
                    Stats = {
                        Cooldown = 0.8,
                        Damage = 7,
                        Range = 11,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Larger Spread (10 > 25)", ""},
                        Attributes = {Spread = 25, ShotSize = 9},
                    },
                },
                {
                    Image = 5587698246,
                    Title = "Tactical Blowback",
                    Cost = 18777,
                    Stats = {
                        Cooldown = 0.8,
                        Damage = 14,
                        Range = 13.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"9 > 12 Pellets", "Larger Spread (25 > 40)"},
                        Attributes = {ShotSize = 12, Spread = 40},
                    },
                },
            },
            Defaults = {
                Price = 1500,
                Range = 8,
                Cooldown = 1.1,
                Damage = 2,
                Limit = 9,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {ShotSize = 8, Spread = 5},
            },
        },
    },
    Properties = {
        Description = "Wields a powerful pump shotgun with small range. Pierces through enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 1,
        EvolvedTo = "EvolvedEnforcer",
        BuyAllLevelsProductId = 3707916598,
        DPS_Display = {DPS = TowerDPS.Shotgun},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 850, Type = Enum.CurrencyType.Coins},
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
            Trumpeter = {Icon = 77609727206044, Rarity = Enum.SkinRarity.Uncommon},
            SciBunny = {Icon = 127092465256309, Rarity = Enum.SkinRarity.Rare},
            Community = {Icon = 130990879836315, Rarity = Enum.SkinRarity.Rare},
            ["Scuba Ops"] = {Icon = 77156430660934, Rarity = Enum.SkinRarity.Rare},
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
        Progression = {MaxLevel = 20, BaseExp = 50, GrowthRate = 1.09},
    },
}