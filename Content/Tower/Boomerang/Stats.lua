-- Script path: ReplicatedStorage.Content.Tower.Boomerang.Stats
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 86490015907171,
                    Title = "Steel Fang",
                    Cost = 400,
                    Stats = {
                        Range = 15,
                        Cooldown = 2.6,
                        Damage = 12,
                        Extras = {},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Attributes = {BoomerangTravelTime = 0.4, BoomerangCount = 1, MaxHits = 3},
                    },
                },
                {
                    Image = 115637133853496,
                    Title = "Firmer Grip",
                    Cost = 750,
                    Stats = {
                        Range = 15,
                        Cooldown = 1.6,
                        Damage = 12,
                        Extras = {},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Attributes = {BoomerangTravelTime = 0.3, BoomerangCount = 1, MaxHits = 4},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Rangs</b></font>",
                            Content = {{Text = "Boomerang Travel Time: 0.4s > 0.3s"}, {Text = "Max Hits: 3 > 4"}},
                        },
                    },
                },
                {
                    Image = 82968142141425,
                    Title = "Twin Strike",
                    Cost = 2500,
                    Stats = {
                        Range = 16,
                        Cooldown = 1.6,
                        Damage = 16,
                        Extras = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {BoomerangTravelTime = 0.3, BoomerangCount = 2, MaxHits = 4},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Rangs</b></font>",
                            Content = {{Text = "Boomerang Count: 1 > 2"}},
                        },
                    },
                },
                {
                    Image = 129523706643871,
                    Title = "Lord Of The Rangs",
                    Cost = 7000,
                    Stats = {
                        Range = 16,
                        Cooldown = 1.4,
                        Damage = 40,
                        Extras = {},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {BoomerangTravelTime = 0.25, BoomerangCount = 2, MaxHits = 5},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Rangs</b></font>",
                            Content = {{Text = "Boomerang Travel Time: 0.3s > 0.25s"}, {Text = "Max Hits: 4 > 5"}},
                        },
                    },
                },
            },
            Defaults = {
                Price = 550,
                Range = 14,
                Cooldown = 2.6,
                Damage = 7,
                Limit = 12,
                Abilities = {},
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                Attributes = {DelayThrow = 1, BoomerangTravelTime = 0.4, BoomerangCount = 1, MaxHits = 3},
            },
        },
    },
    Properties = {
        Description = "Boomerang, you always come back! Throws a boomerang in an arc that pierces multiple enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Counted},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 300, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}