-- Script path: ReplicatedStorage.Content.Tower.Turret.Stats
-- Decompile time: 1.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.4,
                Damage = 20,
                Limit = 3,
                Price = 7750,
                Range = 19,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 3750,
                    Image = 149177741,
                    Title = "Stronger Ammunition",
                    Stats = {
                        Cooldown = 0.4,
                        Damage = 28,
                        Range = 19,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 7500,
                    Image = 149177741,
                    Title = "Radar",
                    Stats = {
                        Cooldown = 0.26,
                        Damage = 28,
                        Range = 22,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 20000,
                    Image = 3584258139,
                    Title = "Dual Turret",
                    Stats = {
                        Cooldown = 0.16,
                        Damage = 35,
                        Range = 22,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 35000,
                    Image = 3584280869,
                    Title = "Even Heavier Ammo",
                    Stats = {
                        Cooldown = 0.16,
                        Damage = 57,
                        Range = 24,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 65000,
                    Image = 3584258608,
                    Title = "XR-200 Turret",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 68,
                        Range = 27,
                        Attributes = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Shoots extremely strong bullets and chews bosses.",
        BoundarySize = 2,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 121 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 50 <= Level.Value
            end,
        },
        Gamepass = {Id = 6935538, Value = 800},
        Class = Enum.TowerType.Ground,
        SkinData = {
            XR500 = {Icon = 88505927728819, Rarity = Enum.SkinRarity.Legendary},
            XR300 = {Icon = 107330122678487, Rarity = Enum.SkinRarity.Rare},
            Crossbow = {Icon = 114313678039848, Rarity = Enum.SkinRarity.Event},
            Jetski = {Icon = 135352734380419, Rarity = Enum.SkinRarity.Legendary},
            Grinch = {Icon = 113374387596411, Rarity = Enum.SkinRarity.Rare},
            Bunny = {Icon = 71461649328033, Rarity = Enum.SkinRarity.Common},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.25, 0),
            Icon = 98957331113953,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}