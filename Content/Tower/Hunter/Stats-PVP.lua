-- Script path: ReplicatedStorage.Content.Tower.Hunter.Stats-PVP
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.7,
                Damage = 20,
                Price = 1600,
                Range = 18,
                Limit = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 750,
                    Image = 3839040358,
                    Title = "Faster Hands",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 20,
                        Range = 21,
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
                    Cost = 1800,
                    Image = 3839041547,
                    Title = "Experienced",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 34,
                        Range = 21,
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
                    Cost = 6250,
                    Image = 3839042767,
                    Title = "Better Gear",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 83,
                        Range = 21,
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
                    Cost = 12000,
                    Image = 3839043838,
                    Title = "Deadliest Hunter",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 162,
                        Range = 24,
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
        Description = "Deal medium damage to enemies with a rifle.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 200, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Halloween = {Icon = 4158020301, Rarity = Enum.SkinRarity.Exclusive},
            Blue = {Icon = 4592603469, Rarity = Enum.SkinRarity.Common},
            ["Vampire Slayer"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4592603469, Rarity = Enum.SkinRarity.Common},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 8021017740,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}