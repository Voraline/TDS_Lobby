-- Script path: ReplicatedStorage.Content.Tower.Hunter.Stats
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 3.45,
                Damage = 45,
                Price = 1625,
                Range = 22,
                Limit = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 725,
                    Image = 3839040358,
                    Title = "Quickscope",
                    Stats = {
                        Cooldown = 2.45,
                        Damage = 45,
                        Range = 22,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 2850,
                    Image = 3839041547,
                    Title = "Survivalist's Kit",
                    Stats = {
                        Cooldown = 2.45,
                        Damage = 96,
                        Range = 24,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 9400,
                    Image = 3839042767,
                    Title = "Sharp Shooter",
                    Stats = {
                        Cooldown = 2.1,
                        Damage = 156,
                        Range = 26,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 20000,
                    Image = 3839043838,
                    Title = "Hunter In The Night",
                    Stats = {
                        Cooldown = 1.8,
                        Damage = 225,
                        Range = 27.5,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Deals high damage at a slow firerate. Great for taking down slow, strong enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 1000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Halloween = {Icon = 4158020301, Rarity = Enum.SkinRarity.Exclusive},
            Blue = {Icon = 4592603469, Rarity = Enum.SkinRarity.Common},
            ["Vampire Slayer"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4592603469, Rarity = Enum.SkinRarity.Common},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
            ["Scuba Ops"] = {Icon = 113904854919814, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 8021017740,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}