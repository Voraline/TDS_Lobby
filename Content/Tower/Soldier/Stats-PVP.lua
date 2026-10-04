-- Script path: ReplicatedStorage.Content.Tower.Soldier.Stats-PVP
-- Decompile time: 2.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.15,
                Damage = 1,
                Price = 450,
                Range = 17,
                Attributes = {Burst = 4, BurstCool = 0.4},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 200,
                    Image = 5523192002,
                    Title = "Better Vision",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 1,
                        Range = 17,
                        Attributes = {Burst = 6, BurstCool = 0.3},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 800,
                    Image = 5523193619,
                    Title = "Better Aiming",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 2,
                        Range = 19,
                        Attributes = {Burst = 6, BurstCool = 0.3},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 3000,
                    Image = 5523195646,
                    Title = "Equipment Upgrades",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 4,
                        Range = 21,
                        Attributes = {Burst = 8, BurstCool = 0.3},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (5)"},
                    },
                },
                {
                    Cost = 8000,
                    Image = 5523196519,
                    Title = "Deadliest Soldier",
                    Stats = {
                        Cooldown = 0.1,
                        Damage = 8,
                        Range = 21,
                        Attributes = {Burst = 10, BurstCool = 0.2},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (7)"},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 0.1,
                Damage = 1,
                Price = 500,
                Range = 14,
                Attributes = {Burst = 4, BurstCool = 0.75},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 150,
                    Image = 5523192002,
                    Title = "Trigger Finger",
                    Stats = {
                        Cooldown = 0.08,
                        Damage = 1,
                        Range = 14,
                        Attributes = {Burst = 4, BurstCool = 0.6},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Decreased burst cooldown"},
                    },
                },
                {
                    Cost = 800,
                    Image = 5523193619,
                    Title = "Better Aiming",
                    Stats = {
                        Cooldown = 0.08,
                        Damage = 2,
                        Range = 17,
                        Attributes = {Burst = 4, BurstCool = 0.6},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 3000,
                    Image = 5523195646,
                    Title = "Equipment Upgrades",
                    Stats = {
                        Cooldown = 0.08,
                        Damage = 3,
                        Range = 17,
                        Attributes = {Burst = 20, BurstCool = 1.2},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (20)"},
                    },
                },
                {
                    Cost = 12000,
                    Image = 5523196519,
                    Title = "Deadliest's Soldier",
                    Stats = {
                        Cooldown = 0.06,
                        Damage = 8,
                        Range = 19,
                        Attributes = {Burst = 30, BurstCool = 1.2},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (30)"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A cheap and effective burst tower. Great for beginners!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Burst},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 350, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Golden = {Icon = 4793530742, Rarity = Enum.SkinRarity.Golden},
            Party = {Icon = 3986416465, Rarity = Enum.SkinRarity.Exclusive},
            Blue = {Icon = 3986413617, Rarity = Enum.SkinRarity.Common},
            Doughboy = {Icon = 4793530742, Rarity = Enum.SkinRarity.Common},
            Toy = {Icon = 4793530742, Rarity = Enum.SkinRarity.Common},
            ["Cold Soldier"] = {Icon = 4079607793, Rarity = Enum.SkinRarity.Uncommon},
            Red = {Icon = 3986415239, Rarity = Enum.SkinRarity.Common},
            Valentines = {Icon = 3986415239, Rarity = Enum.SkinRarity.Common},
            Ducky = {Icon = 3986415239, Rarity = Enum.SkinRarity.Common},
            ["Grand Theft"] = {Icon = 3986415239, Rarity = Enum.SkinRarity.Common},
            Holiday = {Icon = 4343065951, Rarity = Enum.SkinRarity.Event},
            ["Beast Slayer"] = {Icon = 4343065951, Rarity = Enum.SkinRarity.Event},
            Liberator = {Icon = 4343065951, Rarity = Enum.SkinRarity.Rare},
            Classic = {Icon = 4343065951, Rarity = Enum.SkinRarity.Exclusive},
            Toilet = {Icon = 4343065951, Rarity = Enum.SkinRarity.Legendary},
            ["Stealth Ops"] = {Icon = 100325781772079, Rarity = Enum.SkinRarity.Rare},
            Aerobics = {Icon = 104435661189010, Rarity = Enum.SkinRarity.Common},
            ["Dark Frost"] = {Icon = 79808121861280, Rarity = Enum.SkinRarity.Uncommon},
            Korblox = {Icon = 70787227887803, Rarity = Enum.SkinRarity.Event},
            Bunny = {Icon = 90125360452717, Rarity = Enum.SkinRarity.Uncommon},
            Null = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 9391770610,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}