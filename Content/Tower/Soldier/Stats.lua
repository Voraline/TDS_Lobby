-- Script path: ReplicatedStorage.Content.Tower.Soldier.Stats
-- Decompile time: 4.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.175,
                Damage = 1,
                Price = 400,
                Range = 17,
                Attributes = {Burst = 3, BurstCool = 0.5},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 100,
                    Image = 5523192002,
                    Title = "Barracks Training",
                    Stats = {
                        Cooldown = 0.15,
                        Damage = 1,
                        Range = 17,
                        Attributes = {Burst = 3, BurstCool = 0.4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 700,
                    Image = 5523193619,
                    Title = "Better Aiming",
                    Stats = {
                        Cooldown = 0.15,
                        Damage = 2,
                        Range = 19,
                        Attributes = {Burst = 4, BurstCool = 0.4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (4)"},
                    },
                },
                {
                    Cost = 1850,
                    Image = 5523195646,
                    Title = "Equipment Upgrades",
                    Stats = {
                        Cooldown = 0.15,
                        Damage = 4,
                        Range = 19,
                        Attributes = {Burst = 8, BurstCool = 0.4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (8)", "Decreased burst cooldown (0.4s)"},
                    },
                },
                {
                    Cost = 6000,
                    Image = 5523196519,
                    Title = "Deadliest Soldier",
                    Stats = {
                        Cooldown = 0.15,
                        Damage = 10,
                        Range = 22,
                        Attributes = {Burst = 12, BurstCool = 0.4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (12)", ""},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 0.15,
                Damage = 1,
                Price = 450,
                Range = 17,
                Attributes = {Burst = 4, BurstCool = 0.45},
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
                        Cooldown = 0.12,
                        Damage = 1,
                        Range = 17,
                        Attributes = {Burst = 4, BurstCool = 0.35},
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
                    Title = "Field Training",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 2,
                        Range = 20,
                        Attributes = {Burst = 5, BurstCool = 0.35},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Increased burst (5)"},
                    },
                },
                {
                    Cost = 3400,
                    Image = 5523195646,
                    Title = "Gilded Gear",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 4,
                        Range = 20,
                        Attributes = {Burst = 8, BurstCool = 0},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Full Auto!"},
                    },
                },
                {
                    Cost = 11350,
                    Image = 5523196519,
                    Title = "Maximum Potential",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 12,
                        Range = 22,
                        Attributes = {Burst = 12, BurstCool = 0},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {""},
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
            Patriotic = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
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