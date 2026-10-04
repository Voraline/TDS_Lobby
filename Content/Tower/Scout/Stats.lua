-- Script path: ReplicatedStorage.Content.Tower.Scout.Stats
-- Decompile time: 1.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 3278746120,
                    Title = "Faster Reloading",
                    Cost = 50,
                    Stats = {Cooldown = 0.75, Range = 12, Damage = 1},
                },
                {
                    Image = 3278749117,
                    Title = "Precise Aiming",
                    Cost = 375,
                    Stats = {
                        Range = 14,
                        Damage = 3,
                        Cooldown = 0.75,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 3278741672,
                    Title = "Stronger Equipment",
                    Cost = 1350,
                    Stats = {Cooldown = 0.65, Range = 16, Damage = 8},
                },
                {
                    Image = 3279537687,
                    Title = "Akimbo Handguns",
                    Cost = 2200,
                    Stats = {Range = 16, Cooldown = 0.325, Damage = 8},
                },
            },
            Defaults = {
                Price = 125,
                Range = 12,
                Cooldown = 1,
                Damage = 1,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
            },
        },
        Golden = {
            Defaults = {
                Price = 250,
                Range = 14,
                Cooldown = 0.75,
                Damage = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
            },
            Upgrades = {
                {
                    Image = 3032133716,
                    Title = "Higher Caliber",
                    Cost = 150,
                    Stats = {Range = 15, Damage = 2, Cooldown = 0.5},
                },
                {
                    Image = 115730014,
                    Title = "Precise Aiming",
                    Cost = 600,
                    Stats = {
                        Range = 15,
                        Cooldown = 0.5,
                        Damage = 5,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 3278741672,
                    Title = "Golden Deagle",
                    Cost = 1800,
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 30,
                        Range = 18,
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                    },
                },
                {
                    Image = 3279537687,
                    Title = "Twin Sovereigns",
                    Cost = 4000,
                    Stats = {Range = 18, Cooldown = 0.6, Damage = 36},
                },
            },
        },
    },
    Properties = {
        Description = "The starter tower of the game.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        EvolvedTo = "EvolvedOperator",
        BuyAllLevelsProductId = 3603641854,
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 0, Type = Enum.CurrencyType.Free},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Guest = {Icon = 17571579155, Rarity = Enum.SkinRarity.Exclusive},
            Blue = {Icon = 4863402918, Rarity = Enum.SkinRarity.Common},
            Bunny = {Icon = 4863402726, Rarity = Enum.SkinRarity.Event},
            Eclipse = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            ["Black Ops"] = {Icon = 4863403124, Rarity = Enum.SkinRarity.Common},
            Survivor = {Icon = 4863402484, Rarity = Enum.SkinRarity.Rare},
            Party = {Icon = 4863401994, Rarity = Enum.SkinRarity.Exclusive},
            Green = {Icon = 4863401820, Rarity = Enum.SkinRarity.Common},
            Golden = {Icon = 4863401634, Rarity = Enum.SkinRarity.Golden},
            Red = {Icon = 4863402220, Rarity = Enum.SkinRarity.Common},
            Beach = {Icon = 4863402220, Rarity = Enum.SkinRarity.Event},
            Intern = {Icon = 4863402220, Rarity = Enum.SkinRarity.Rare},
            ["Prime Raven"] = {Icon = 4863402220, Rarity = Enum.SkinRarity.Legendary},
            Holiday = {Icon = 4343065951, Rarity = Enum.SkinRarity.Event},
            Valentines = {Icon = 4343065951, Rarity = Enum.SkinRarity.Common},
            Cookie = {Icon = 4343065951, Rarity = Enum.SkinRarity.Exclusive},
            ["Frost Hunter"] = {Icon = 4343065951, Rarity = Enum.SkinRarity.Common},
            Plushie = {Icon = 4343065951, Rarity = Enum.SkinRarity.Exclusive},
            Ducky = {Icon = 4343065951, Rarity = Enum.SkinRarity.Common},
            ["Skull Trooper"] = {Icon = 4863402918, Rarity = Enum.SkinRarity.Exclusive},
            Masquerade = {Icon = 4863402918, Rarity = Enum.SkinRarity.Event},
            Valhalla = {Icon = 4863402918, Rarity = Enum.SkinRarity.Event},
            Phantom = {Icon = 4863402918, Rarity = Enum.SkinRarity.Uncommon},
            Toilet = {Icon = 4863402918, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18739982633, Rarity = Enum.SkinRarity.Rare},
            ["King of Rock"] = {Icon = 117402710044000, Rarity = Enum.SkinRarity.Common},
            Haz3mn = {Icon = 130252324129434, Rarity = Enum.SkinRarity.Event},
            Shark = {Icon = 89854318503673, Rarity = Enum.SkinRarity.Uncommon},
            Banned = {Icon = 89854318503673, Rarity = Enum.SkinRarity.Exclusive},
            Penguin = {Icon = 93624861426111, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883304439,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.356194490192345, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
        Progression = {MaxLevel = 20, BaseExp = 50, GrowthRate = 1.09},
    },
}